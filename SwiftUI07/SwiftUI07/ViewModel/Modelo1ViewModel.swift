//
//  Modelo1ViewModel.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import Foundation // 📌 Importamos Foundation para manejar la red y la decodificación de JSON.

class Modelo1ViewModel: ObservableObject { // 📌 `Modelo1ViewModel` es un ViewModel que maneja la obtención de datos desde la API.
    
    @Published var datosModelo: [Modelo1] = [] // ✅ `@Published` permite actualizar la vista automáticamente cuando cambian los datos.

    init() { // ✅ `init()` es el constructor que se ejecuta al crear una instancia de `Modelo1ViewModel`.
        fetch() // 🔵 Llama a `fetch()` automáticamente para obtener los datos cuando se crea el objeto.
    }
    
    func fetch() { // 📌 `fetch()` obtiene datos de la API y los almacena en `datosModelo`.
        
        // ✅ Construye la URL de la API que devuelve una lista de usuarios.
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        // ✅ Realiza una petición HTTP GET a la API usando `URLSession`.
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // ✅ Si no se reciben datos, la función termina.
            guard let data = data else { return }
            
            do {
                // ✅ Decodifica el JSON en un array de `Modelo1`.
                let json = try JSONDecoder().decode([Modelo1].self, from: data)
                
                // ✅ Actualiza la vista en el **hilo principal** con los datos obtenidos.
                DispatchQueue.main.async {
                    self.datosModelo = json // 🔵 Almacena los datos en `datosModelo`, lo que actualizará la vista automáticamente.
                }
            } catch let error as NSError {
                // ❌ Si hay un error en la decodificación del JSON, lo muestra en consola.
                print("Error en el JSON: \(error.localizedDescription)")
            }

        }.resume() // ✅ Inicia la tarea de red para obtener los datos.
    }
}

