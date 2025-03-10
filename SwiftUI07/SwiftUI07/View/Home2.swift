//
//  Home2.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import SwiftUI // 📌 Importamos SwiftUI para construir la interfaz gráfica.

struct Home2: View { // 📌 Define una vista llamada `Home2`, que muestra una lista de usuarios con imágenes.
    
    @StateObject var json2 = Modelo2ViewModel() // ✅ `@StateObject` crea una instancia de `Modelo2ViewModel`, que obtiene datos de la API.

    var body: some View {
        if json2.datosModelo.data.isEmpty { // ✅ Si `data` está vacío, significa que aún no se han cargado los datos.
            ProgressView() // 🔵 Muestra un indicador de carga mientras se obtienen los datos.
        
        } else { // ✅ Si los datos ya están listos, se muestra la lista de usuarios.
            List(json2.datosModelo.data, id: \.id) { item in // 🔵 Itera sobre la lista de usuarios y los muestra en la `List`.
                
                NavigationLink(destination: DetalleView(id: item.id)) { // ✅ Al tocar un usuario, navega a `DetalleView` con su `id`.
                    HStack { // 🔵 Organiza la imagen y los textos en una fila horizontal.

                        // ✅ Carga la imagen del usuario de forma asíncrona desde la URL
                        AsyncImage(url: URL(string: item.avatar)!) { image in
                            image
                                .resizable() // 🔵 Permite que la imagen se pueda escalar.
                                .frame(width: 80, height: 80) // 🔵 Tamaño fijo de la imagen (80x80 píxeles).
                                .clipped() // 🔵 Recorta la imagen si es necesario.
                                .clipShape(Circle()) // 🔵 Convierte la imagen en un círculo.
                        } placeholder: {
                            ProgressView() // 🔵 Muestra un indicador de carga mientras la imagen se descarga.
                        }

                        VStack(alignment: .leading) { // ✅ Muestra la información del usuario en una columna alineada a la izquierda.
                            Text(item.first_name).font(.title) // 🔵 Muestra el nombre del usuario con un estilo grande.
                            Text(item.email).font(.subheadline) // 🔵 Muestra el email del usuario en un estilo más pequeño.
                        }
                    }
                    .navigationBarTitle("Json con imagen") // ✅ Define el título de la barra de navegación.
                }
            }
        }
    }
}

