//
//  DetalleView.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import SwiftUI // 📌 Importamos SwiftUI para construir la interfaz gráfica.

struct DetalleView: View { // 📌 Vista que muestra los detalles de un usuario.
    var id: Int // ✅ Identificador del usuario a consultar.
    
    @StateObject var user = DetalleViewModel() // ✅ `@StateObject` crea una instancia de `DetalleViewModel`, que manejará la obtención de datos del usuario.

    var body: some View {
        VStack { // ✅ Organiza los elementos en una columna vertical.
            
            if user.avatar.isEmpty { // ✅ Si `avatar` está vacío, significa que aún no se han cargado los datos.
                ProgressView() // 🔵 Muestra un indicador de carga mientras se obtiene la información del usuario.
            } else { // ✅ Cuando `avatar` ya tiene datos, se muestra la información del usuario.
                
                AsyncImage(url: URL(string: user.avatar)!) { image in // ✅ Carga la imagen de perfil de manera asíncrona.
                    image
                        .resizable() // 🔵 Permite que la imagen se pueda escalar.
                        .frame(width: 130, height: 130) // 🔵 Define un tamaño fijo de 130x130 píxeles.
                        .clipped() // 🔵 Recorta la imagen si es necesario.
                        .clipShape(Circle()) // 🔵 Convierte la imagen en un círculo.
                } placeholder: {
                    ProgressView() // 🔵 Muestra un indicador de carga mientras se obtiene la imagen.
                }
                
                Text(user.first_name) // ✅ Muestra el nombre del usuario.
                    .font(.largeTitle) // 🔵 Define un tamaño de fuente grande.

                Text(user.email) // ✅ Muestra el correo electrónico del usuario.
                    .font(.title) // 🔵 Define un tamaño de fuente más pequeño que el nombre.
            }
        }
        .onAppear() { // ✅ `onAppear` se ejecuta cuando la vista aparece en pantalla.
            user.fetch(id: id) // 🔵 Llama a `fetch(id:)` en `DetalleViewModel` para obtener los datos del usuario.
        }
    }
}


