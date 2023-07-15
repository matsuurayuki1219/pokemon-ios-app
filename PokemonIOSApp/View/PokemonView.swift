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

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()

    private lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        return view
    }()

    lazy var pokemonNoLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16.0)
        return view
    }()

    private lazy var pokemonNameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16.0)
        return view
    }()

    override func didMoveToSuperview() {
        addSubview(containerView)
        backgroundColor = UIColor.gray90
        containerView.addSubview(imageView)
        containerView.addSubview(pokemonNoLabel)
        containerView.addSubview(pokemonNameLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width
        let height = bounds.height
        initContainerView(width: width, height: height)
        initImageView(width: width, height: height)
        initUILabel(width: width, height: height)
    }

    private func initContainerView(width: CGFloat, height: CGFloat) {
        containerView.frame = CGRect(x: 40, y: 0, width: width, height: height)
        containerView.layer.cornerRadius = height / 2
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }

    private func initImageView(width: CGFloat, height: CGFloat) {
        let verticalMargin = CGFloat(8)
        imageView.frame = CGRect(x: height / 4, y: verticalMargin, width: 100, height: height - verticalMargin * 2)
    }

    private func initUILabel(width: CGFloat, height: CGFloat) {
        let verticalMargin = CGFloat(16)
        pokemonNoLabel.frame = CGRect(x: imageView.bounds.width + imageView.frame.origin.x + 30, y: verticalMargin, width: 100, height: height / 2 - verticalMargin)
        pokemonNameLabel.frame = CGRect(x: imageView.bounds.width + imageView.frame.origin.x + 30, y: verticalMargin + pokemonNoLabel.bounds.height, width: 100, height: height / 2 - verticalMargin)
    }

    func setImageUrl(url: String) {
        guard let url = URL(string: url) else { return }
        Nuke.loadImage(with: url, into: imageView)
    }

    func setPokemonNo(number: String) {
        pokemonNoLabel.text = "No.\(number)"
    }

    func setPokemonName(name: String) {
        pokemonNameLabel.text = name
    }

}
