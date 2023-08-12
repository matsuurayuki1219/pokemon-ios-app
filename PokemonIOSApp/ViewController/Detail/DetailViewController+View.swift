//
//  DetailViewController+View.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/28.
//

import Foundation
import UIKit
import Nuke

extension DetailViewController {

    class PokemonDetailView: UIView {

        private lazy var halfCircleView: HalfCircleView = {
            let view = HalfCircleView()
            return view
        }()

        private lazy var imageView: UIImageView = {
            let view = UIImageView()
            return view
        }()

        private lazy var numberLabel: UILabel = {
            let view = UILabel()
            view.font = UIFont.systemFont(ofSize: 20.0)
            return view
        }()

        private lazy var nameLabel: UILabel = {
            let view = UILabel()
            view.font = UIFont.systemFont(ofSize: 24.0)
            return view
        }()

        private lazy var pokemonTypeView: PokemonInfoView = {
            let view = PokemonInfoView()
            view.setTitle(title: "Type")
            return view
        }()

        private lazy var pokemonHeighteView: PokemonInfoView = {
            let view = PokemonInfoView()
            view.setTitle(title: "Height")
            return view
        }()

        private lazy var pokemonWeightView: PokemonInfoView = {
            let view = PokemonInfoView()
            view.setTitle(title: "Weight")
            return view
        }()

        override func didMoveToSuperview() {
            addSubview(halfCircleView)
            addSubview(imageView)
            addSubview(numberLabel)
            addSubview(nameLabel)
            addSubview(pokemonTypeView)
            addSubview(pokemonHeighteView)
            addSubview(pokemonWeightView)
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            let width = bounds.width
            let height = bounds.height
            let top = safeAreaInsets.top
            layoutHalfCircleView(width: width, height: height, top: top)
            layoutImageView(width: width, height: height, top: top)
            layoutPokemonInfoView()
        }

        private func layoutHalfCircleView(width: CGFloat, height: CGFloat, top: CGFloat) {
            halfCircleView.frame = CGRect(x: 0, y: 0, width: width, height: width / 2)
        }

        private func layoutImageView(width: CGFloat, height: CGFloat, top: CGFloat) {
            let imageWidth = width * 0.6
            imageView.frame = CGRect(x: width * 0.2, y: top + 50, width: imageWidth, height: imageWidth)
        }

        private func layoutPokemonInfoView() {
            pokemonTypeView.frame = CGRect(x: 24, y: nameLabel.frame.origin.y + nameLabel.frame.height + 40, width: frame.width - 24, height: 64)
            pokemonHeighteView.frame = CGRect(x: 24, y: pokemonTypeView.frame.origin.y + pokemonTypeView.frame.height + 20, width: frame.width - 24, height: 64)
            pokemonWeightView.frame = CGRect(x: 24, y: pokemonHeighteView.frame.origin.y + pokemonHeighteView.frame.height + 20, width: frame.width - 24, height: 64)
        }

        func setHalfCircleColor(type: PokemonType) {
            let color = type.toColor()
            halfCircleView.setBgColor(color: color)
        }

        func setImage(url: String) {
            guard let url = URL(string: url) else { return }
            Nuke.loadImage(with: url, into: imageView)
        }

        func setNumber(text: String) {
            numberLabel.text = "No." + text
            numberLabel.sizeToFit()
            numberLabel.frame = CGRect(x: 24, y: imageView.frame.origin.y + imageView.frame.height + 36, width: numberLabel.frame.width, height: numberLabel.frame.height)
        }

        func setName(text: String) {
            nameLabel.text = text
            nameLabel.sizeToFit()
            nameLabel.frame = CGRect(x: 24, y: numberLabel.frame.origin.y + numberLabel.frame.height + 20, width: nameLabel.frame.width, height: nameLabel.frame.height)
        }

        func setType(types: [PokemonType]) {
            if (types.count == 1) {
                pokemonTypeView.setContent(content: types.first!.rawValue)
            } else {
                var strings = ""
                for i in 0...types.count - 1 {
                    if (i == 0) {
                        strings += types[i].rawValue
                    } else {
                        strings += " / " + types[i].rawValue
                    }

                }
                pokemonTypeView.setContent(content: strings)
            }
        }

        func setHeight(height: Int) {
            let height = Float(height) * 0.1
            pokemonHeighteView.setContent(content: String(height) + " m")
        }

        func setWeight(weight: Int) {
            let weight = Float(weight) * 0.1
            pokemonWeightView.setContent(content: String(weight) + " kg")
        }

    }

}
