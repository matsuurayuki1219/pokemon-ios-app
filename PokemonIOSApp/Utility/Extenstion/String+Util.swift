//
//  String+Util.swift
//  PokemonIOSApp
//
//  Created by 松浦裕久 on 2023/07/15.
//

import Foundation

extension String {

    func extractLastPathFromUrl() -> Int {
        let segments = components(separatedBy: "/").filter { !$0.isEmpty }
        return Int(segments.last!)!
    }
}
