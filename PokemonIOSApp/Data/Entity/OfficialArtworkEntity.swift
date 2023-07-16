//
//  OfficialArtworkEntity.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/15.
//

import Foundation

struct OfficialArtworkEntity: Decodable {
    let frontDefault: String

    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
