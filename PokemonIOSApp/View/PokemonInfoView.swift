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
        let image = UIImage(systemName: "face.smiling.fill")
        view.image = image
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
        view.textAlignment = NSTextAlignment.right
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
        let width = frame.width
        let height = frame.height
        layoutParentView(width: width, height: height)
        layoutImageView(width: width, height: height)
        layoutTitleLabel(width: width, height: height)
        layoutContentLabel(width: width, height: height)
    }

    private func layoutParentView(width: CGFloat, height: CGFloat) {
        layer.cornerRadius = height / 2
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        backgroundColor = UIColor.dragon
    }


    private func layoutImageView(width: CGFloat, height: CGFloat) {
        let margin = CGFloat(16)
        let size = height - margin * 2
        imageView.frame = CGRect(x: margin, y: margin, width: size, height: size)
    }

    private func layoutTitleLabel(width: CGFloat, height: CGFloat) {
        let x = imageView.frame.width + imageView.frame.origin.x
        titleLabel.frame = CGRect(x: x + 16, y: 0, width: titleLabel.frame.width, height: height)
    }

    private func layoutContentLabel(width: CGFloat, height: CGFloat) {
        let x = titleLabel.frame.width + titleLabel.frame.origin.x
        contentLabel.frame = CGRect(x: x, y: 0, width: width - x, height: height)
    }

    func setTitle(title: String) {
        titleLabel.text = title
        titleLabel.sizeToFit()
        let x = imageView.frame.width + imageView.frame.origin.x
        titleLabel.frame = CGRect(x: x + 8, y: 0, width: titleLabel.frame.width, height: frame.height)
    }

    func setContent(content: String) {
        contentLabel.text = content
        contentLabel.sizeToFit()
        let x = titleLabel.frame.width + titleLabel.frame.origin.x
        contentLabel.frame = CGRect(x: x + 8, y: 0, width: frame.width - x - 8, height: frame.height)
        contentLabel.backgroundColor = UIColor.dark
    }

}
