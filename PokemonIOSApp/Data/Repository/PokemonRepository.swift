//
//  PokemonRepository.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/11.
//

import Foundation

class PokemonRepository {

    func getPokemonInfo(
        completion: @escaping (Result<PokemonEntity, Error>) -> Void
    ) {
        PokemonApi.shared.getPokemonList { result in
            completion(result)
        }
    }
}
