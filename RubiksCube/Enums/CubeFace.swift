//
//  CubeFace.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import Foundation

enum CubeFace: Int {
    case front = 0
    case back
    case left
    case right
    case top
    case bottom
    
    var title: String {
        switch self {
            case .front:
                "Front"

            case .back:
                "Back"

            case .left:
                "Left"

            case .right:
                "Right"

            case .top:
                "Top"

            case .bottom:
                "Bottom"
        }
    }

    static var titles: [String] {
        return [CubeFace.top.title.capitalized,
                CubeFace.bottom.title.capitalized,
                CubeFace.left.title.capitalized,
                CubeFace.right.title.capitalized,
                CubeFace.front.title.capitalized,
                CubeFace.back.title.capitalized]
    }
}
