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

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    }
}
