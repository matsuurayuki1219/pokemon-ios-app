//
//  TypeEntity+Util.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/28.
//

import Foundation

extension TypeDetailEntity {

    func toModel() -> PokemonType {
        switch name {
        case "normal":
            return PokemonType.NORMAL
        case "fire":
            return PokemonType.FIRE
        case "water":
            return PokemonType.WATER
        case "electric":
            return PokemonType.ELECTRIC
        case "grass":
            return PokemonType.GRASS
        case "ice":
            return PokemonType.ICE
        case "fighting":
            return PokemonType.FIGHTING
        case "poison":
            return PokemonType.POISON
        case "ground":
            return PokemonType.GROUND
        case "flying":
            return PokemonType.FLYING
        case "psychic":
            return PokemonType.PSYCHIC
        case "bug":
            return PokemonType.BUG
        case "rock":
            return PokemonType.ROCK
        case "ghost":
            return PokemonType.GHOST
        case "dragon":
            return PokemonType.DRAGON
        case "dark":
            return PokemonType.DARK
        case "steel":
            return PokemonType.STEEL
        case "fairy":
            return PokemonType.FAIRY
        default:
            return PokemonType.UNKNOWN
        }
    }
}
