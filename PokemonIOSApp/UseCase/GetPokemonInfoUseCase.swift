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
        repository.getPokemonInfo { [weak self] result in
            switch result {
            case .success(let pokemonInfo):
                let pokemonId = 1
                let pokemonList = pokemonInfo.results
                self?.repository.getPokemonDeital(pokemonId: pokemonId) { result in
                    switch result {
                    case .success(let pokemonDetail):
                        let converted = pokemonList.map {
                            PokemonModel.init(
                                id: pokemonId,
                                enName: $0.name,
                                imageUrl: pokemonDetail.sprites.other.officialArtwork.front_default
                            )
                        }
                        completion(.success(converted))
                        break
                    case .failure(let error):
                        completion(.failure(error))
                        break
                    }
                }
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }

}
