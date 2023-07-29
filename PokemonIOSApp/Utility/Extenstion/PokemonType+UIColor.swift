//
//  PokemonType+UIColor.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/29.
//

import Foundation
import UIKit

extension PokemonType {

    func toColor() -> UIColor {
        switch self {
        case .NORMAL:
            return UIColor.normal
        case .FIRE:
            return UIColor.fire
        case .WATER:
            return UIColor.water
        case .ELECTRIC:
            return UIColor.electric
        case .GRASS:
            return UIColor.grass
        case .ICE:
            return UIColor.ice
        case .FIGHTING:
            return UIColor.fighting
        case .POISON:
            return UIColor.poison
        case .GROUND:
            return UIColor.ground
        case .FLYING:
            return UIColor.flying
        case .PSYCHIC:
            return UIColor.psychic
        case .BUG:
            return UIColor.bug
        case .ROCK:
            return UIColor.rock
        case .GHOST:
            return UIColor.ghost
        case .DRAGON:
            return UIColor.dragon
        case .DARK:
            return UIColor.dark
        case .STEEL:
            return UIColor.steel
        case .FAIRY:
            return UIColor.fairy
        default:
            return UIColor.unknown
        }
    }
}
