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

    class PokemonInfoView: UIView {

        private lazy var imageView: UIImageView = {
            let view = UIImageView()
            return view
        }()

        override func didMoveToSuperview() {
            addSubview(imageView)
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            let width = bounds.width
            let height = bounds.height
            setImageView(width: width, height: height)
        }

        private func setImageView(width: CGFloat, height: CGFloat) {
            let imageWidth = width * 0.6
            imageView.frame = CGRect(x: width * 0.2, y: 100, width: imageWidth, height: imageWidth)
        }

        func setImage(url: String) {
            guard let url = URL(string: url) else { return }
            Nuke.loadImage(with: url, into: imageView)
        }

    }

}
