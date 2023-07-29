//
//  DetailViewController.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/16.
//

import UIKit

class DetailViewController: UIViewController {

    var pokemonId: Int?

    private let useCase = GetPokemonDetailInfoUseCase()

    private lazy var pokemonView: PokemonDetailView = {
        let view = PokemonDetailView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray90
        view.addSubview(pokemonView)
        fetchData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        pokemonView.frame = view.bounds
    }

    private func fetchData() {
        guard let id = pokemonId else { return }
        useCase.execute(pokemonId: id, completion: { [weak self] result in
            switch result {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self?.pokemonView.setHalfCircleColor(type: pokemon.type.first ?? PokemonType.UNKNOWN)
                    self?.pokemonView.setImage(url: pokemon.imageUrl)
                    self?.pokemonView.setNumber(text: String(pokemon.id))
                    self?.pokemonView.setName(text: pokemon.enName)
                }
            case .failure(let error):
                let a = 2
            }
        }
        )
    }

}
