//
//  SwiftUI07App.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import SwiftUI // 📌 Importamos SwiftUI, el framework para construir la interfaz de usuario.

@main // ✅ Marca esta estructura como el punto de entrada principal de la aplicación.
struct SwiftUI07App: App { // 📌 Define la estructura principal de la aplicación en SwiftUI.
    
    var body: some Scene { // ✅ Define la escena principal de la app.
        
        let login = PostViewModel() // ✅ Creamos una instancia de `PostViewModel`, que manejará la autenticación del usuario.
        
        WindowGroup { // ✅ Define la ventana principal de la aplicación.
            ContentView() // 🔵 `ContentView` es la vista principal de la app.
                .environmentObject(login) // ✅ Pasamos `login` como un `@EnvironmentObject`, permitiendo que todas las vistas accedan a él.
        }
    }
}
