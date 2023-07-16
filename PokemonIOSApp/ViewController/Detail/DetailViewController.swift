//
//  DetailViewController.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/16.
//

import UIKit

class DetailViewController: UIViewController {

    var pokemonId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print(String(pokemonId!))
    }
}
