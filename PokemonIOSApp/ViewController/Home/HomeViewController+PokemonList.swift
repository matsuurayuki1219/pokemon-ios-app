//
//  HomeViewController+PokemonList.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/12.
//

import Foundation
import UIKit

protocol PokemonListDelegate {

}


extension HomeViewController {

    class PokemonList: UIView {

        private lazy var tableView: UITableView = {
            let view = UITableView(frame: .zero, style: .plain)
            view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            view.delegate = self
            view.dataSource = self
            return view
        }()

    }


}

// MARK: - Delegate

extension HomeViewController.PokemonList: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}

extension HomeViewController.PokemonList: UITableViewDelegate {

}
