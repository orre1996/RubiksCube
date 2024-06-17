//
//  IsometricCubeView.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-15.
//

import SwiftUI

struct IsometricCubeView: View {
    private let cube: [CubeFace: [[TileColor]]]
    private let geometryProxy: GeometryProxy

    init(cube: [CubeFace: [[TileColor]]], geometryProxy: GeometryProxy) {
        self.cube = cube
        self.geometryProxy = geometryProxy
    }

    var body: some View {
        let tileSize = min(geometryProxy.size.width, geometryProxy.size.height) / 5

        ZStack {
            ForEach(0..<3, id: \.self) { column in
                ForEach(0..<3, id: \.self) { row in
                    if let frontFace = cube[.front]?[column][row] {
                        drawFrontSquare(with: frontFace.color, column: column, row: row, tileSize: tileSize)
                    }

                    if let topFace = cube[.top]?[column][row] {
                        drawTopSquare(with: topFace.color, column: column, row: row, tileSize: tileSize)
                    }

                    if let rightFace = cube[.right]?[column][row] {
                        drawRightSquare(with: rightFace.color, column: column, row: row, tileSize: tileSize)
                    }
                }
            }
        }
        .offset(x: -(tileSize * 1.75), y: -(tileSize / 3))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    @ViewBuilder
    private func drawFrontSquare(with color: Color, column: Int, row: Int, tileSize: CGFloat) -> some View {
        color
            .frame(width: tileSize, height: tileSize)
            .border(Color.black, width: 0.5)
            .offset(x: CGFloat(row) * tileSize, y: CGFloat(column) * tileSize)
    }

    @ViewBuilder
    private func drawTopSquare(with color: Color, column: Int, row: Int, tileSize: CGFloat) -> some View {
        Color.clear
            .frame(width: tileSize, height: tileSize)
            .offset(x: CGFloat(row) * tileSize, y: CGFloat(column) * tileSize)
            .background(TopFaceTile(row: row, column: column, tileSize: tileSize)
                .stroke(Color.black)
                .fill(color)
            )
    }

    @ViewBuilder
    private func drawRightSquare(with color: Color, column: Int, row: Int, tileSize: CGFloat) -> some View {
        Color.clear
            .frame(width: tileSize, height: tileSize)
            .offset(x: CGFloat(row) * tileSize, y: CGFloat(column) * tileSize)
            .background(RightFaceTile(row: row, column: column, tileSize: tileSize)
                .stroke(Color.black)
                .fill(color)
            )
    }
}

#Preview {
    GeometryReader { geometryProxy in
        IsometricCubeView(cube: [:], geometryProxy: geometryProxy)
    }
}
