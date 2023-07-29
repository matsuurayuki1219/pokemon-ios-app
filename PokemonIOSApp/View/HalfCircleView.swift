//
//  HalfCircleView.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/29.
//

import Foundation
import UIKit

class HalfCircleView: UIView {

    private let start = 0.0
    private let end = CGFloat(Double.pi)

    private lazy var path: UIBezierPath = {
        let path = UIBezierPath()
        return path
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        path.move(to: CGPointMake(frame.width / 2, frame.height / 2))
        path.addArc(withCenter: CGPointMake(frame.width / 2, frame.height / 2), radius: frame.width / 2, startAngle: start, endAngle: end, clockwise: true)
    }

    func setBgColor(color: UIColor) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = color.cgColor
        shapeLayer.path = path.cgPath
        layer.addSublayer(shapeLayer)
    }

}
