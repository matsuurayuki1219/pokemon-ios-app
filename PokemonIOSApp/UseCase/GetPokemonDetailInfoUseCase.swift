//
//  GetPokemonDetailInfoUseCase.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/28.
//

import Foundation

class GetPokemonDetailInfoUseCase {

    private let repository = PokemonRepository()

    func execute(
        pokemonId: Int,
        completion: @escaping (Result<PokemonDetailModel, Error>) -> Void
    ) {
        let pokemon = repository.getPokemonDeital(pokemonId: pokemonId) { result in
            switch result {
            case .success(let entity):
                let enName = entity.name
                let imageUrl = entity.sprites.other.officialArtwork.frontDefault
                let weight = entity.weight
                let height = entity.height
                let types = entity.types.map { $0.type.toModel() }
                let model = PokemonDetailModel.init(
                    id: pokemonId,
                    enName: enName,
                    imageUrl: imageUrl,
                    type: types,
                    weight: weight,
                    height: height,
                    evolutions: []
                )
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
