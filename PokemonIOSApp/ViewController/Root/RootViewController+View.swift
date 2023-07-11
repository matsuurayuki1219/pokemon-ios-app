//
//  RootViewController+View.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/11.
//

import Foundation
import UIKit

extension RootViewController {

    class SplashView: UIView {

        private lazy var logoImageView: UIImageView =  {
            let imageView = UIImageView(image: UIImage(named: "img_logo"))
            return imageView
        }()

        override func didMoveToSuperview() {
            backgroundColor = UIColor.white
            addSubview(logoImageView)
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            let width = bounds.width
            let height = bounds.height
            let top = safeAreaInsets.top
            let bottom = safeAreaInsets.bottom

            logoImageView.sizeToFit()
            let x = (width - logoImageView.bounds.width) / 2
            let y = (height - logoImageView.bounds.height - top - bottom) / 2
            logoImageView.frame = CGRect(x: x, y: y, width: logoImageView.bounds.width, height: logoImageView.bounds.height)
        }

    }
}
