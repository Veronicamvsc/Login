//
//  Modelo2ViewModel.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import Foundation // 📌 Importamos Foundation para manejar la red y la decodificación de JSON.

class Modelo2ViewModel: ObservableObject { // 📌 `Modelo2ViewModel` sigue el patrón MVVM y maneja la obtención de datos desde una API.
    
    @Published var datosModelo = Modelo2(data: []) // ✅ `@Published` actualiza la vista automáticamente cuando los datos cambian.
    
    init() { // ✅ `init()` se ejecuta automáticamente al crear una instancia de `Modelo2ViewModel`.
        fetch() // 🔵 Llama a `fetch()` para obtener los datos cuando se crea el objeto.
    }
    
    func fetch() { // 📌 `fetch()` obtiene los datos de la API y los almacena en `datosModelo`.
        
        // ✅ Construye la URL de la API que devuelve una lista de usuarios en la página 2.
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else { return }
        
        // ✅ Realiza una petición HTTP GET a la API usando `URLSession`.
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // ✅ Si no se reciben datos, la función termina.
            guard let data = data else { return }
            
            do {
                // ✅ Decodifica el JSON en un objeto `Modelo2`, que contiene la lista de usuarios.
                let json = try JSONDecoder().decode(Modelo2.self, from: data)
                
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

