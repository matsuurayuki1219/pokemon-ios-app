//
//  RootViewController.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/10.
//

import Foundation
import UIKit

class RootViewController: UIViewController {

    private lazy var logoImage: UIImageView =  {
        let imageView = UIImageView(image: UIImage(named: "img_logo"))
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoImage)
    }

}

