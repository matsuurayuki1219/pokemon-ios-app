//
//  PokemonView.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/12.
//

import Foundation
import UIKit
import Nuke

class PokemonView: UIView {

    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()

    lazy var pokemonNoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        return view
    }()

    private lazy var pokemonNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        return view
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
        let height = bounds.height
        initParentView(height: height)
        initImageView(width: width, height: height)
        initUILabel(width: width, height: height)
    }

    private func initParentView(height: CGFloat) {
        layer.cornerRadius = height / 2
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        backgroundColor = UIColor.cyan
    }

    private func initImageView(width: CGFloat, height: CGFloat) {
        imageView.frame = CGRect(x: height / 2, y: 10, width: 100, height: height)
    }

    private func initUILabel(width: CGFloat, height: CGFloat) {
        pokemonNoLabel.font = UIFont.systemFont(ofSize: 14.0)
        pokemonNoLabel.frame = CGRect(x: imageView.bounds.width, y: 0, width: 100, height: height / 2)
        pokemonNameLabel.font = UIFont.systemFont(ofSize: 14.0)
        pokemonNameLabel.frame = CGRect(x: imageView.bounds.width, y: height / 2, width: 100, height: height / 2)
    }

    func setImageUrl(url: String) {
        guard let url = URL(string: url) else { return }
        Nuke.loadImage(with: url, into: imageView)
    }

    func setPokemonNo(number: String) {
        pokemonNoLabel.text = number
    }

    func setPokemonName(name: String) {
        pokemonNameLabel.text = name
    }

}
