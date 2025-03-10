//
//  Home.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import SwiftUI // 📌 Importamos SwiftUI para construir la interfaz gráfica.

struct Home: View { // 📌 Define la vista principal después de que el usuario inicia sesión.
    
    @EnvironmentObject var login: PostViewModel // ✅ `@EnvironmentObject` permite acceder a `PostViewModel`, que maneja la autenticación.
    @StateObject var json = Modelo1ViewModel() // ✅ `@StateObject` crea una instancia de `Modelo1ViewModel`, que obtiene los datos de una API.

    var body: some View {
        NavigationStack { // ✅ `NavigationStack` permite la navegación entre vistas.
            
            if json.datosModelo.isEmpty { // ✅ Si `datosModelo` está vacío, significa que los datos aún no se han cargado.
                ProgressView() // 🔵 Muestra un indicador de carga mientras se obtienen los datos.
            
            } else { // ✅ Cuando los datos han sido cargados, se muestra la lista.
                List(json.datosModelo, id: \.id) { item in // 🔵 Muestra una lista de usuarios obtenidos de la API.
                    VStack(alignment: .leading) { // 🔵 Organiza el contenido de cada celda alineado a la izquierda.
                        Text(item.name) // ✅ Muestra el nombre del usuario.
                        Text(item.email) // ✅ Muestra el email del usuario.
                        Text(item.address.geo.lat) // ✅ Muestra la latitud de la ubicación del usuario.
                        Text(item.address.geo.lng) // ✅ Muestra la longitud de la ubicación del usuario.
                    }
                }
                .navigationBarTitle("JSON") // ✅ Define el título de la barra de navegación.

                .navigationBarItems(leading: Button(action: { // ✅ Agrega un botón a la barra de navegación para cerrar sesión.
                    UserDefaults.standard.removeObject(forKey: "sesion") // 🔵 Elimina la sesión guardada en `UserDefaults`.
                    login.authenticated = 0 // 🔵 Cambia el estado de autenticación a `0`, volviendo a la pantalla de Login.
                }) {
                    Text("Salir") // 🔵 Texto del botón.
                
                }, trailing: // ✅ Agrega un botón de navegación en la parte derecha.
                
                NavigationLink(destination: Home2()) { // 🔵 `NavigationLink` permite navegar a la vista `Home2`.
                    Text("Siguiente") // 🔵 Texto del botón de navegación.
                })
            }
        }
    }
}

            }
        }
    }
}


