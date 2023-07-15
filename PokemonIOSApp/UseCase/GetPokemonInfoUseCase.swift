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
        let semaphore = DispatchSemaphore(value: 0)
        var pokemonList: [PokemonInfoEntity] = []

        repository.getPokemonInfo { result in
            switch result {
            case .success(let pokemonInfo):
                pokemonList = pokemonInfo.results
                semaphore.signal()
            case .failure(let error):
                completion(.failure(error))
                semaphore.signal()
                break
            }
        }
        semaphore.wait()

        var pokemonModels: [PokemonModel] = []

        pokemonList.forEach {
            let pokemonId = $0.url.extractLastPathFromUrl()
            let pokemonName = $0.name
            repository.getPokemonDeital(pokemonId: pokemonId) { result in
                switch result {
                case .success(let pokemonDetail):
                    let converted = PokemonModel.init(
                        id: pokemonId,
                        enName: pokemonName,
                        imageUrl: pokemonDetail.sprites.other.officialArtwork.front_default
                    )
                    pokemonModels.append(converted)
                    semaphore.signal()
                    break
                case .failure(let error):
                    completion(.failure(error))
                    semaphore.signal()
                    break
                }
            }
            semaphore.wait()
        }
        completion(.success(pokemonModels))
    }

}
