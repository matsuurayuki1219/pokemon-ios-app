//
//  GetPokemonInfoUseCase.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/11.
//

import Foundation

class GetPokemonInfoUseCase {

    private let repository = PokemonRepository()

    func execute(
        completion: @escaping (Result<[PokemonModel], Error>) -> Void
    ) {
        repository.getPokemonInfo { result in
            switch result {
            case .success(let pokemonInfo):
                let pokemonList = pokemonInfo.results
                let converted = pokemonList.map {
                    PokemonModel.init(
                        id: 1,
                        enName: $0.name,
                        imageUrl: $0.url
                    )
                }
                completion(.success(converted))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
