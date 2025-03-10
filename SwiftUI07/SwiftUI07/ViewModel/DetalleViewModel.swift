//
//  DetalleViewModel.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import Foundation // 📌 Importamos Foundation para manejar la red y la decodificación de JSON.

class DetalleViewModel: ObservableObject { // 📌 `DetalleViewModel` sigue el patrón MVVM y permite actualizar la vista en tiempo real.
    
    @Published var first_name = "" // ✅ Variable `first_name` para almacenar el nombre del usuario y actualizar la vista.
    @Published var email = "" // ✅ Variable `email` para almacenar el correo del usuario.
    @Published var avatar = "" // ✅ Variable `avatar` para almacenar la URL de la imagen del usuario.

    func fetch(id: Int) { // 📌 `fetch(id:)` obtiene los datos de un usuario desde la API según su `id`.
        
        // ✅ Construye la URL con el `id` del usuario.
        guard let url = URL(string: "https://reqres.in/api/users/\(id)") else { return }
        
        // ✅ Realiza una petición HTTP GET a la API usando `URLSession`.
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // ✅ Si no se reciben datos, la función termina.
            guard let data = data else { return }
            
            do {
                // ✅ Decodifica el JSON en la estructura `User`.
                let json = try JSONDecoder().decode(User.self, from: data)
                
                // ✅ Actualiza la vista en el **hilo principal** con los datos del usuario.
                DispatchQueue.main.async {
                    self.first_name = json.data.first_name // 🔵 Asigna el nombre del usuario.
                    self.email = json.data.email // 🔵 Asigna el correo del usuario.
                    self.avatar = json.data.avatar // 🔵 Asigna la URL del avatar del usuario.
                }
            } catch let error as NSError {
                // ❌ Si hay un error en la decodificación del JSON, lo muestra en consola.
                print("Error en el JSON: \(error.localizedDescription)")
            }

        }.resume() // ✅ Inicia la tarea de red para obtener los datos.
    }
}

