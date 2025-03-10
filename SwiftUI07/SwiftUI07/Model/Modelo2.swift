//
//  Modelo2.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import Foundation // 📌 Importamos Foundation para manejar la decodificación de JSON.

struct Modelo2: Decodable { // 📌 `Modelo2` representa una respuesta que contiene una lista de usuarios.
    var data: [UserList] // ✅ `data` es una lista de usuarios (estructura `UserList`).
}

struct User: Decodable { // 📌 `User` representa un solo usuario dentro de `data`.
    var data: UserList // ✅ `data` contiene un objeto `UserList`, que almacena la información del usuario.
}

struct UserList: Decodable { // 📌 `UserList` representa la estructura de un usuario en la API.
    var id: Int // ✅ Identificador único del usuario.
    var first_name: String // ✅ Nombre del usuario.
    var email: String // ✅ Dirección de correo electrónico del usuario.
    var avatar: String // ✅ URL de la imagen de perfil del usuario.
}
