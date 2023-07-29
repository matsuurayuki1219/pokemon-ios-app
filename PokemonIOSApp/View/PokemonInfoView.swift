//
//  PokemonInfoView.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/29.
//

import Foundation
import UIKit

class PokemonInfoView: UIView {

    private lazy var imageView = {
        let view = UIImageView()
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16.0)
        return view
    }()

    private lazy var contentLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16.0)
        return view
    }()

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(contentLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }
}
