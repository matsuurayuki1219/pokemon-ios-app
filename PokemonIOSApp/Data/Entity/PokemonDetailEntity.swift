//
//  PokemonDetailEntity.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/15.
//

import Foundation

struct PokemonDetailEntity: Decodable {
    let sprites: SpritesEntity
    let weight: Int
    let height: Int
    let name: String
    let types: [TypeEntity]
}
