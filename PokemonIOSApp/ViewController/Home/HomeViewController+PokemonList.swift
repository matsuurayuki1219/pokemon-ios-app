//
//  HomeViewController+PokemonList.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/12.
//

import Foundation
import UIKit

extension HomeViewController {

    class PokemonList: UIView {

        private(set) var items = [PokemonModel]()

        private lazy var tableView: UITableView = {
            let view = UITableView(frame: .zero, style: .plain)
            view.register(PokemonCell.self, forCellReuseIdentifier: "Cell")
            view.delegate = self
            view.dataSource = self
            return view
        }()

        override func layoutSubviews() {
            super.layoutSubviews()
            tableView.frame = bounds
        }

        override func willMove(toSuperview newSuperview: UIView?) {
            super.willMove(toSuperview: newSuperview)
            addSubview(tableView)
        }

        func reload(items: [PokemonModel]) {
            self.items = items
            tableView.reloadData()
        }

    }

}

// MARK: - Delegate

extension HomeViewController.PokemonList: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PokemonCell
        cell.pokemonView.setImageUrl(url: item.imageUrl)
        cell.pokemonView.setPokemonName(name: item.enName)
        cell.pokemonView.setPokemonNo(number: String(item.id))
        cell.selectionStyle = .none
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return CGFloat(60)

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)

    }

}

extension HomeViewController.PokemonList: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}

}
