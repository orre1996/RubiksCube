//
//  TopFaceTile.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-15.
//

import SwiftUI

struct TopFaceTile: Shape {
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
        let bottomLeftX = CGFloat(row) * tileSize + CGFloat(2 - column) * tileSize / 2
        let bottomLeftY = CGFloat(column - 2) * tileSize / 2

        Path { path in
            path.move(to: CGPoint(x: bottomLeftX, y: bottomLeftY))
            path.addLine(to: CGPoint(x: bottomLeftX + tileSize / 2, y: bottomLeftY - tileSize / 2))
            path.addLine(to: CGPoint(x: bottomLeftX + tileSize / 2 + tileSize, y: bottomLeftY - tileSize / 2))
            path.addLine(to: CGPoint(x: bottomLeftX + tileSize, y: bottomLeftY))
            path.closeSubpath()
        }
    }
}

#Preview {
    TopFaceTile(row: 0, column: 0, tileSize: 50)
}
