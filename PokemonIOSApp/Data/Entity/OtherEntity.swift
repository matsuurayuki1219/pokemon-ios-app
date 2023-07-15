//
//  OtherEntity.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/15.
//

import Foundation

struct OtherEntity: Decodable {
    let officialArtwork: OfficialArtworkEntity

    private enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}
