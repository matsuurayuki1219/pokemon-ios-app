//
//  RootViewController.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/10.
//

import Foundation
import UIKit

class RootViewController: UIViewController {

    private let SPLASH_INTERVAL = 2.0

    private lazy var splashView: SplashView =  {
        let view = SplashView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(splashView)
        initTimer()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
    }

    private func initTimer() {
        Timer.scheduledTimer(
            withTimeInterval: SPLASH_INTERVAL,
            repeats: false
        ) { [weak self] _ in
            let vc = HomeViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

