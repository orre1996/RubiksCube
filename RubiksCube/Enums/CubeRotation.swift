//
//  CubeRotation.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

enum CubeRotation {
    case clockwise
    case counterClockwise

    var icon: Image {
        switch self {
            case .clockwise:
                return .arrowClockwise

            case .counterClockwise:
                return .arrowCounterClockwise
        }
    }
}
