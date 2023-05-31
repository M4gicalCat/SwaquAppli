//
//  Swallower.swift
//  SwaquAppli
//
//  Created by faisandier philippe on 31/05/2023.
//

import Foundation

struct Swallower: Codable {
    let id: Int
    let username: String
    let gorgees: Int
    let token: String
}

struct AuthError: Codable {
    let message: String
}
