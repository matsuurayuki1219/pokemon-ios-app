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
            view.separatorStyle = .none
            view.backgroundColor = UIColor.gray90
            return view
        }()

        override func layoutSubviews() {
            super.layoutSubviews()
            backgroundColor = UIColor.black
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
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let marginView = UIView()
        marginView.backgroundColor = .gray90
        return marginView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PokemonCell
        cell.pokemonView.setImageUrl(url: item.imageUrl)
        cell.pokemonView.setPokemonName(name: item.enName)
        cell.pokemonView.setPokemonNo(number: String(item.id))
        cell.selectionStyle = .none
        return cell
    }

}

extension HomeViewController.PokemonList: UITableViewDelegate {

}
