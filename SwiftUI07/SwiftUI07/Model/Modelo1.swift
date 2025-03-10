//
//  Modelo1.swift
//  SwiftUI07
//
//  Created by José Antonio Lara Sánchez on 12/2/25.
//

import Foundation // 📌 Importamos Foundation para manejar estructuras de datos y decodificación JSON.

struct Modelo1: Decodable { // 📌 Define una estructura `Modelo1` que representa un usuario y puede decodificarse desde JSON.
    var id: Int // ✅ Identificador único del usuario.
    var name: String // ✅ Nombre del usuario.
    var email: String // ✅ Dirección de correo electrónico del usuario.
    var address: Address // ✅ Dirección del usuario (estructura anidada).
}

struct Address: Decodable { // 📌 Define una estructura `Address` para representar la dirección del usuario.
    var street: String // ✅ Calle donde vive el usuario.
    var suite: String // ✅ Número o unidad dentro del edificio.
    var city: String // ✅ Ciudad donde vive el usuario.
    var geo: Geo // ✅ Coordenadas geográficas del usuario (estructura anidada).
}

struct Geo: Decodable { // 📌 Define una estructura `Geo` para almacenar la latitud y longitud de la dirección.
    var lat: String // ✅ Latitud de la ubicación del usuario.
    var lng: String // ✅ Longitud de la ubicación del usuario.
}
