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

        override func didMoveToSuperview() {
            addSubview(halfCircleView)
            addSubview(imageView)
            addSubview(numberLabel)
            addSubview(nameLabel)
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            let width = bounds.width
            let height = bounds.height
            let top = safeAreaInsets.top
            setImageView(width: width, height: height, top: top)
            setHalfCircleView(width: width, height: height, top: top)
        }

        private func setHalfCircleView(width: CGFloat, height: CGFloat, top: CGFloat) {
            halfCircleView.frame = CGRect(x: 0, y: 0, width: width, height: width / 2)
        }

        private func setImageView(width: CGFloat, height: CGFloat, top: CGFloat) {
            let imageWidth = width * 0.6
            imageView.frame = CGRect(x: width * 0.2, y: top + 50, width: imageWidth, height: imageWidth)
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
            numberLabel.frame = CGRect(x: 48, y: imageView.frame.origin.y + imageView.frame.height + 36, width: numberLabel.frame.width, height: numberLabel.frame.height)
        }

        func setName(text: String) {
            nameLabel.text = text
            nameLabel.sizeToFit()
            nameLabel.frame = CGRect(x: 48, y: numberLabel.frame.origin.y + numberLabel.frame.height + 20, width: nameLabel.frame.width, height: nameLabel.frame.height)
        }

    }

}
