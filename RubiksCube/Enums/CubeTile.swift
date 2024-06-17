//
//  CubeTile.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

enum TileColor {
    case white
    case orange
    case green
    case red
    case blue
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
