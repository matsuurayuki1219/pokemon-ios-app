//
//  PokemonEntity.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/11.
//

import Foundation

struct PokemonEntity: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonInfoEntity]
}
