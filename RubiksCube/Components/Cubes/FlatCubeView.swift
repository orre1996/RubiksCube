//
//  FlatCubeView.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-15.
//

import SwiftUI

struct FlatCubeView: View {
    private let cube: [CubeFace: [[TileColor]]]
    private let geometryProxy: GeometryProxy

    init(cube: [CubeFace: [[TileColor]]], geometryProxy: GeometryProxy) {
        self.cube = cube
        self.geometryProxy = geometryProxy
    }

    var body: some View {
        let tileSize = min(geometryProxy.size.width / 12, geometryProxy.size.height / 9)

        ZStack {
            ForEach(0..<3, id: \.self) { column in
                ForEach(0..<3, id: \.self) { row in
                    if let frontFace = cube[.front]?[column][row] {
                        drawFrontSquare(with: frontFace.color, column: column, row: row, tileSize: tileSize)
                    }

                    if let backFace = cube[.back]?[column][row] {
                        drawFrontSquare(with: backFace.color, column: column, row: row + 6, tileSize: tileSize)
                    }

                    if let leftFace = cube[.left]?[column][row] {
                        drawFrontSquare(with: leftFace.color, column: column, row: row - 3, tileSize: tileSize)
                    }

                    if let rightFace = cube[.right]?[column][row] {
                        drawFrontSquare(with: rightFace.color, column: column, row: row + 3, tileSize: tileSize)
                    }

                    if let topFace = cube[.top]?[column][row] {
                        drawFrontSquare(with: topFace.color, column: column - 3, row: row, tileSize: tileSize)
                    }

                    if let bottomFace = cube[.bottom]?[column][row] {
                        drawFrontSquare(with: bottomFace.color, column: column + 3, row: row, tileSize: tileSize)
                    }
                }
            }
        }
        .offset(x: -(tileSize * 3) + tileSize / 2, y: -tileSize)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    @ViewBuilder
    private func drawFrontSquare(with color: Color, column: Int, row: Int, tileSize: CGFloat) -> some View {
        color
            .frame(width: tileSize, height: tileSize)
            .border(Color.black, width: 0.5)
            .offset(x: CGFloat(row) * tileSize, y: CGFloat(column) * tileSize)
    }
}

#Preview {
    GeometryReader { geometryProxy in
        FlatCubeView(cube: [:], geometryProxy: geometryProxy)
    }
}
