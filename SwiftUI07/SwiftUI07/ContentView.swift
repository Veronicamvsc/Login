//
//  ContentView.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import SwiftUI // 📌 Importamos SwiftUI, el framework para construir la interfaz de usuario.

struct ContentView: View { // 📌 Definimos la vista principal de la aplicación.
    
    @EnvironmentObject var login: PostViewModel // ✅ `@EnvironmentObject` nos permite acceder a la instancia de `PostViewModel`, que gestiona la autenticación del usuario.

    var body: some View {
        Group { // ✅ `Group` agrupa múltiples vistas sin modificar el diseño.
            
            if login.authenticated == 0 { // ✅ Si `authenticated` es 0, significa que el usuario NO ha iniciado sesión.
                Login() // 🔵 Se muestra la pantalla de inicio de sesión.
            
            } else if login.authenticated == 1 { // ✅ Si `authenticated` es 1, el usuario está autenticado correctamente.
                Home() // 🔵 Se muestra la pantalla principal (`Home`).
            
            } else if login.authenticated == 2 { // ✅ Si `authenticated` es 2, hubo un error en la autenticación.
                VStack { // 🔵 Organiza el mensaje de error y el botón en una columna.
                    Text("No se ha podido autenticar") // ❌ Mensaje de error.
                    
                    Button(action: {
                        login.authenticated = 0 // 🔄 Si el usuario presiona el botón, vuelve a la pantalla de Login.
                    }) {
                        Text("Volver") // 🔵 Texto dentro del botón.
                    }
                }
            }
        }
    }
}


