//
//  TypeEntity.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/18.
//

import Foundation

struct TypeEntity: Decodable {
    let slot: Int
    let type: TypeDetailEntity
}
