//
//  PokemonView.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/12.
//

import Foundation
import UIKit

class PokemonView: UIView {

    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()

    private lazy var pokemonNoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        return view
    }()

    private lazy var pokemonNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
    }()

    override func didMoveToSuperview() {
        backgroundColor = UIColor.white
        addSubview(imageView)
        addSubview(pokemonNoLabel)
        addSubview(pokemonNameLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width
        let height = 60
        let x = (width - logoImageView.bounds.width) / 2
        let y = (height - logoImageView.bounds.height - top - bottom) / 2
        logoImageView.frame = CGRect(x: x, y: y, width: logoImageView.bounds.width, height: logoImageView.bounds.height)
    }

    func renderImage() {}

    func setPokemonNo() {}

    func setPokemonName() {}

}
