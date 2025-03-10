//
//  Login.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import SwiftUI // 📌 Importamos SwiftUI para construir la interfaz gráfica.

struct Login: View { // 📌 Vista que maneja el inicio de sesión del usuario.
    
    @State var email: String = "" // ✅ `@State` almacena el texto ingresado en el campo de email.
    @State var password: String = "" // ✅ `@State` almacena el texto ingresado en el campo de contraseña.
    @EnvironmentObject var login: PostViewModel // ✅ `@EnvironmentObject` accede a `PostViewModel`, que maneja la autenticación.

    var body: some View {
        ZStack { // ✅ `ZStack` coloca una vista encima de otra (fondo + formulario).
            Color.blue.edgesIgnoringSafeArea(.all) // 🔵 Establece un fondo azul que cubre toda la pantalla.
            
            VStack { // ✅ Organiza los elementos del formulario en una columna vertical.
                
                Text("Email").foregroundColor(.white).bold() // 🔵 Etiqueta para el campo de email.
                
                TextField("Email", text: $email) // ✅ Campo de entrada de email.
                    .background(Color.white) // 🔵 Fondo blanco para diferenciarlo del fondo azul.
                    .textFieldStyle(RoundedBorderTextFieldStyle()) // 🔵 Aplica un estilo de borde redondeado.
                    .keyboardType(.emailAddress) // ✅ Configura el teclado para ingresar un email.
                
                Text("Password").foregroundColor(.white).bold() // 🔵 Etiqueta para el campo de contraseña.
                
                SecureField("Password", text: $password) // ✅ Campo de entrada de contraseña (oculta el texto).
                    .background(Color.white) // 🔵 Fondo blanco para el campo de contraseña.
                    .textFieldStyle(RoundedBorderTextFieldStyle()) // 🔵 Aplica un estilo de borde redondeado.

                Button(action: { // ✅ Botón para iniciar sesión.
                    self.login.login(email: self.email, password: self.password) // 🔵 Llama a la función `login()` en `PostViewModel`, enviando el email y la contraseña.
                }) {
                    Text("Entrar").foregroundColor(.white).bold() // 🔵 Botón con texto blanco y en negrita.
                }
                
            }.padding(.all) // ✅ Agrega espacio alrededor del formulario.
        }
    }
}





