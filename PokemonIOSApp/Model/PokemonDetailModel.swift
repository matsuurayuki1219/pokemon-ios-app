//
//  PokemonDetailModel.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/18.
//

import Foundation

struct PokemonDetailModel {
    let id: Int
    let enName: String
    let imageUrl: String
    let type: [PokemonType]
    let weight: Int
    let height: Int
    let evolutions: [PokemonEvolutionModel]
}
