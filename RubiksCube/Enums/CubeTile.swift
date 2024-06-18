//
//  CubeTile.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

enum TileColor: Int {
    case red = 0
    case orange
    case blue
    case green
    case white
    case yellow

    var color: Color {
        switch self {
            case .white:
                return .primaryWhite

            case .orange:
                return .primaryOrange

            case .green:
                return .primaryGreen

            case .red:
                return .primaryRed

            case .blue:
                return .primaryBlue

            case .yellow:
                return .primaryYellow
        }
    }
}
