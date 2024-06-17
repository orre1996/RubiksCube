//
//  RightFaceTile.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-15.
//

import SwiftUI

struct RightFaceTile: Shape {
    private let row: Int
    private let column: Int
    private let tileSize: CGFloat

    init(row: Int, column: Int, tileSize: CGFloat) {
        self.row = row
        self.column = column
        self.tileSize = tileSize
    }

    @ViewBuilder
    func path(in rect: CGRect) -> Path {
        let topLeftX = 3 * tileSize + CGFloat(row) * tileSize / 2
        let topLeftY = -CGFloat(row) * tileSize / 2 + CGFloat(column) * tileSize

        Path { path in
            path.move(to: CGPoint(x: topLeftX, y: topLeftY))
            path.addLine(to: CGPoint(x: topLeftX + tileSize / 2, y: topLeftY - tileSize / 2))
            path.addLine(to: CGPoint(x: topLeftX + tileSize / 2, y: topLeftY + tileSize / 2))
            path.addLine(to: CGPoint(x: topLeftX, y: topLeftY + tileSize))
            path.closeSubpath()
        }
    }
}

#Preview {
    RightFaceTile(row: 0, column: 0, tileSize: 50)
}
