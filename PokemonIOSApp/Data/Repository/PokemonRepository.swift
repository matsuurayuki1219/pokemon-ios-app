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

    func getPokemonDeital(
        pokemonId: Int,
        completion: @escaping (Result<PokemonDetailEntity, Error>) -> Void
    ) {
        PokemonApi.shared.getPokemonDetail(pokemonId: pokemonId, completion: { result in
            completion(result)
        }
    )}

    func getPokemonSpecies(
        pokemonId: Int,
        completion: @escaping (Result<PokemonSpeciesEntity, Error>) -> Void
    ) {
        PokemonApi.shared.getPokemonSpecies(pokemonId: pokemonId, completion: { result in
            completion(result)
        }
    )}

    func getPokemonEvolution(
        chainId: Int,
        completion: @escaping (Result<EvolutionChainEntity, Error>) -> Void
    ) {
        PokemonApi.shared.getEvolutionChain(chainId: chainId, completion: { result in
            completion(result)
        }
    )}

}
