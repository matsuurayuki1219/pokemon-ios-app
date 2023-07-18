//
//  PokemonSpeciesEntity.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/18.
//

import Foundation

struct PokemonSpeciesEntity: Decodable {
    let evolutionChain: EvolutionChainEntity

    private enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
    }
}
