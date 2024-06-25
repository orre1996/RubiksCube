//
//  RubiksCubeViewModel.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

@Observable
class RubiksCubeViewModel {
    var cube = [CubeFace: [[TileColor]]]()
    var selectedFace: CubeFace?

    init(predefinedCube: [CubeFace: [[TileColor]]]? = nil) {
        if let predefinedCube {
            cube = predefinedCube
        } else {
            resetCube()
        }
    }

    func resetCube() {
        for i in 0..<6 {
            guard let face = CubeFace(rawValue: i) else {
                fatalError("Couldn't find CubeFace with rawValue \(i)")
            }

            guard let color = TileColor(rawValue: i) else {
                fatalError("Couldn't find TileColor with rawValue \(i)")
            }

            cube[face] = Array(repeating: Array(repeating: color, count: 3), count: 3)
        }
    }

    func shuffleCube() {
        resetCube()

        for _ in 0..<20 {
            let faceNumber = Int.random(in: 0..<6) % 6
            let clockwise = Int.random(in: 0..<2).isMultiple(of: 2)

            guard let selectedFace = CubeFace(rawValue: faceNumber) else { return }

            cube[selectedFace] = cube[selectedFace]?.rotate2DArray(clockwise: clockwise)

            switch selectedFace {
                case .bottom:
                    rotateBottomFace(clockwise: clockwise)

                case .top:
                    rotateTopFace(clockwise: clockwise)

                case .right:
                    rotateRightFace(clockwise: clockwise)

                case .left:
                    rotateLeftFace(clockwise: clockwise)

                case .back:
                    rotateBackFace(clockwise: clockwise)

                default:
                    rotateFrontFace(clockwise: clockwise)
            }
        }
    }

    func rotateFace(direction: CubeRotation) {
        guard let selectedFace = selectedFace else { return }
        
        // Rotate the selected face itself
        cube[selectedFace] = cube[selectedFace]?.rotate2DArray(clockwise: direction == .clockwise)

        switch selectedFace {
            case .top:
                rotateTopFace(clockwise: direction == .clockwise)

            case .bottom:
                rotateBottomFace(clockwise: direction == .clockwise)

            case .left:
                rotateLeftFace(clockwise: direction == .clockwise)

            case .right:
                rotateRightFace(clockwise: direction == .clockwise)

            case .front:
                rotateFrontFace(clockwise: direction == .clockwise)

            case .back:
                rotateBackFace(clockwise: direction == .clockwise)
        }
    }

    private func rotateRightFace(clockwise: Bool) {
        // Store current state
        let frontFace = (0..<3).map({ getTile(for: .front, row: $0, column: 2) })
        let bottomFace = (0..<3).map({ getTile(for: .bottom, row: $0, column: 2) })
        let topFace = (0..<3).map({ getTile(for: .top, row: $0, column: 2) })
        let backFace = (0..<3).map({ getTile(for: .back, row: $0, column: 0) })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[i][2] = clockwise ? bottomFace[i] : topFace[i]
            cube[.top]?[i][2] = clockwise ? frontFace[i] : backFace.reversed()[i]
            cube[.back]?[i][0] = clockwise ? topFace.reversed()[i] : bottomFace.reversed()[i]
            cube[.bottom]?[i][2] = clockwise ? backFace.reversed()[i] : frontFace[i]
        }
    }

    private func rotateLeftFace(clockwise: Bool) {
        // Store current state
        let frontFace = (0..<3).map({ getTile(for: .front, row: $0, column: 0) })
        let bottomFace = (0..<3).map({ getTile(for: .bottom, row: $0, column: 0) })
        let topFace = (0..<3).map({ getTile(for: .top, row: $0, column: 0) })
        let backFace = (0..<3).map({ getTile(for: .back, row: $0, column: 2) })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[i][0] = clockwise ? topFace[i] : bottomFace[i]
            cube[.top]?[i][0] = clockwise ? backFace.reversed()[i] : frontFace[i]
            cube[.bottom]?[i][0] = clockwise ? frontFace[i] : backFace.reversed()[i]
            cube[.back]?[i][2] = clockwise ? bottomFace.reversed()[i] : topFace.reversed()[i]
        }
    }

    private func rotateTopFace(clockwise: Bool) {
        // Store current state
        let frontFace = (0..<3).map({ getTile(for: .front, row: 0, column: $0) })
        let rightFace = (0..<3).map({ getTile(for: .right, row: 0, column: $0) })
        let backFace = (0..<3).map({ getTile(for: .back, row: 0, column: $0) })
        let leftFace = (0..<3).map({ getTile(for: .left, row: 0, column: $0) })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[0][i] = clockwise ? rightFace[i] : leftFace[i]
            cube[.left]?[0][i] = clockwise ? frontFace[i] : backFace[i]
            cube[.back]?[0][i] = clockwise ? leftFace[i] : rightFace[i]
            cube[.right]?[0][i] = clockwise ? backFace[i] : frontFace[i]
        }
    }

    private func rotateBottomFace(clockwise: Bool) {
        // Store current state
        let frontFace = (0..<3).map({ getTile(for: .front, row: 2, column: $0) })
        let rightFace = (0..<3).map({ getTile(for: .right, row: 2, column: $0) })
        let backFace = (0..<3).map({ getTile(for: .back, row: 2, column: $0) })
        let leftFace = (0..<3).map({ getTile(for: .left, row: 2, column: $0) })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[2][i] = clockwise ? leftFace[i] : rightFace[i]
            cube[.left]?[2][i] = clockwise ? backFace[i] : frontFace[i]
            cube[.back]?[2][i] = clockwise ? rightFace[i] : leftFace[i]
            cube[.right]?[2][i] = clockwise ? frontFace[i] : backFace[i]
        }
    }

    private func rotateFrontFace(clockwise: Bool) {
        // Store current state
        let bottomFace = (0..<3).map({ getTile(for: .bottom, row: 0, column: $0) })
        let rightFace = (0..<3).map({ getTile(for: .right, row: $0, column: 0) })
        let topFace = (0..<3).map({ getTile(for: .top, row: 2, column: $0) })
        let leftFace = (0..<3).map({ getTile(for: .left, row: $0, column: 2) })

        // Set new states
        for i in 0..<3 {
            cube[.top]?[2][i] = clockwise ? leftFace.reversed()[i] : rightFace[i]
            cube[.right]?[i][0] = clockwise ? topFace[i] : bottomFace.reversed()[i]
            cube[.bottom]?[0][i] = clockwise ? rightFace.reversed()[i] : leftFace[i]
            cube[.left]?[i][2] = clockwise ? bottomFace[i] : topFace.reversed()[i]
        }
    }

    private func rotateBackFace(clockwise: Bool) {
        // Store current state
        let bottomFace = (0..<3).map({ getTile(for: .bottom, row: 2, column: $0) })
        let rightFace = (0..<3).map({ getTile(for: .right, row: $0, column: 2) })
        let topFace = (0..<3).map({ getTile(for: .top, row: 0, column: $0) })
        let leftFace = (0..<3).map({ getTile(for: .left, row: $0, column: 0) })

        // Set new states
        for i in 0..<3 {
            cube[.top]?[0][i] = clockwise ? rightFace[i] : leftFace.reversed()[i]
            cube[.right]?[i][2] = clockwise ? bottomFace.reversed()[i] : topFace[i]
            cube[.bottom]?[2][i] = clockwise ? leftFace[i] : rightFace.reversed()[i]
            cube[.left]?[i][0] = clockwise ? topFace.reversed()[i] : bottomFace[i]
        }
    }

    private func getTile(for face: CubeFace, row: Int, column: Int) -> TileColor {
        guard let color = cube[face]?[safely: row]?[safely: column] else {
            fatalError("Couldn't find color for \(face) face, row \(row) and column \(column)")
        }

        return color
    }
}
