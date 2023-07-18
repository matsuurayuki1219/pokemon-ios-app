//
//  HomeViewController.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/10.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var tableView: PokemonList = {
        let view = PokemonList()
        return view
    }()

    private let useCase = GetPokemonInfoUseCase()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        initNavBar()
        fetchData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func initNavBar() {
        title = Constant.APP_TITLE
        navigationItem.hidesBackButton = true
    }

    private func fetchData() {
        useCase.execute { [weak self] result in
            switch result {
            case .success(let pokemonList):
                DispatchQueue.main.async {
                    self?.tableView.reload(items: pokemonList)
                }
            case .failure(let error):
                let a = 2
            }
        }
    }

}


extension HomeViewController: PokemonListTableViewDelegate {

    func pokemonListTableViewCell(didSelectPokemonId: Int) {
        let vc = DetailViewController()
        vc.pokemonId = didSelectPokemonId
        navigationController?.pushViewController(vc, animated: true)
    }
}

