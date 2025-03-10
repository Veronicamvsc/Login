//
//  PostViewModel.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import Foundation // 📌 Importamos Foundation para manejar la red, JSON y UserDefaults.

class PostViewModel: ObservableObject { // 📌 `PostViewModel` maneja la autenticación del usuario en la app.
    
    @Published var authenticated = 0 // ✅ `@Published` permite actualizar la UI automáticamente cuando cambia `authenticated`.
    
    init() { // ✅ `init()` se ejecuta cuando se crea una instancia de `PostViewModel`.
        
        //login(email: "eve.holt@reqres.in", password: "cityslicka") // 🔵 Esta línea está comentada, pero si se activa, intentará iniciar sesión automáticamente.

        // ✅ Recupera el estado de autenticación desde `UserDefaults`.
        if let sesion = UserDefaults.standard.object(forKey: "sesion") as? Int {
            authenticated = sesion // 🔵 Si hay un valor guardado en `UserDefaults`, lo asigna a `authenticated`.
        } else {
            authenticated = 0 // 🔵 Si no hay sesión guardada, el usuario no está autenticado.
        }
    }
    
    func login(email: String, password: String) { // 📌 `login()` intenta iniciar sesión con la API.
        
        // ✅ Construcción de la URL para hacer la petición de login.
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        
        // ✅ Parámetros que se enviarán en la petición (email y password).
        let parametros = ["email": email, "password": password]
        
        // ✅ Convierte los parámetros en formato JSON.
        let body = try! JSONSerialization.data(withJSONObject: parametros)
        
        // ✅ Configuración de la solicitud HTTP.
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // 🔵 La API requiere un método POST para autenticar.
        request.httpBody = body // 🔵 Enviamos los parámetros en el cuerpo de la solicitud.
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // 🔵 Especificamos que enviamos datos en formato JSON.

        // ✅ Realiza la petición HTTP.
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let response = response {
                print(response) // 🔵 Imprime la respuesta del servidor en consola.
            }
            
            // ✅ Verifica si se recibió una respuesta con datos.
            guard let data = data else { return }
            
            do {
                // ✅ Decodifica el JSON recibido en un objeto `PostModel`.
                let datos = try JSONDecoder().decode(PostModel.self, from: data)
                
                // ✅ Si la API devuelve un token válido, el login fue exitoso.
                if !datos.token.isEmpty {
                    DispatchQueue.main.async {
                        //print(datos.token) // 🔵 Aquí se podría imprimir el token en consola.
                        self.authenticated = 1 // 🔵 Cambia el estado de autenticación a 1 (usuario autenticado).
                        UserDefaults.standard.setValue(1, forKey: "sesion") // 🔵 Guarda la sesión en `UserDefaults` para recordar el login.
                    }
                }
            } catch let error as NSError {
                print("Error al hacer post", error.localizedDescription) // ❌ Muestra un mensaje si la autenticación falla.
                
                DispatchQueue.main.async {
                    self.authenticated = 2 // 🔵 Si el login falla, cambia `authenticated` a 2 (error de autenticación).
                }
            }
        }.resume() // ✅ Inicia la petición HTTP.
    }
}

