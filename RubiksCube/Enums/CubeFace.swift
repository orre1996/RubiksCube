//
//  CubeFace.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import Foundation

enum CubeFace: String {
    case top
    case bottom
    case left
    case right
    case front
    case back

    static var titles: [String] {
        return [CubeFace.top.rawValue.capitalized,
                CubeFace.bottom.rawValue.capitalized,
                CubeFace.left.rawValue.capitalized,
                CubeFace.right.rawValue.capitalized,
                CubeFace.front.rawValue.capitalized,
                CubeFace.back.rawValue.capitalized]
    }
}
