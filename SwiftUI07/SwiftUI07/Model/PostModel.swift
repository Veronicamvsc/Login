//
//  PostModel.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import Foundation // 📌 Importamos Foundation para manejar estructuras de datos y decodificación JSON.

struct PostModel: Decodable { // 📌 `PostModel` representa la respuesta JSON de una API después de iniciar sesión.
    var token: String // ✅ `token` almacena el **token de autenticación** recibido desde el servidor.
}
