//
//  PokemonApi.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/11.
//

import Foundation

class PokemonApi {

    private let BASE_URL = "https://pokeapi.co/api/v2"

    private init() {}

    public static let shared = PokemonApi()

    func getPokemonList(
        completion: @escaping (Result<PokemonEntity, Error>) -> Void
    ) {
        let url = URL(string: BASE_URL + "/pokemon")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                let decorder = JSONDecoder()
                do {
                    let decoded = try decorder.decode(PokemonEntity.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
}
