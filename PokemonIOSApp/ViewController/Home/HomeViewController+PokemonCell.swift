//
//  HomeViewController+PokemonCell.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/12.
//

import Foundation
import UIKit

extension HomeViewController.PokemonList {

    class PokemonCell: UITableViewCell {

        lazy var pokemonView: PokemonView = {
            let view = PokemonView()
            return view
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            pokemonView.frame = bounds
        }

        override func willMove(toSuperview newSuperview: UIView?) {
            super.willMove(toSuperview: newSuperview)
            addSubview(pokemonView)
        }

    }
}
