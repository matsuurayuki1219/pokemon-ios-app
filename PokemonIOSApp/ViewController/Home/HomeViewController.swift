//
//  HomeViewController.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/10.
//

import UIKit

class HomeViewController: UIViewController {

    private let useCase = GetPokemonInfoUseCase()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.blue
        fetchData()
    }

    private func fetchData() {
        useCase.execute { result in
            switch result {
            case .success(let pokemonList):
                let a = 2
            case .failure(let error):
                let a = 2
            }
        }
    }

}
