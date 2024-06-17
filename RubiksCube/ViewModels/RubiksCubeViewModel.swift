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
        cube[.front] = Array(repeating: Array(repeating: .red, count: 3), count: 3)
        cube[.back] = Array(repeating: Array(repeating: .orange, count: 3), count: 3)
        cube[.left] = Array(repeating: Array(repeating: .blue, count: 3), count: 3)
        cube[.right] = Array(repeating: Array(repeating: .green, count: 3), count: 3)
        cube[.top] = Array(repeating: Array(repeating: .white, count: 3), count: 3)
        cube[.bottom] = Array(repeating: Array(repeating: .yellow, count: 3), count: 3)
    }

    func shuffleCube() {
        resetCube()

        var colors = [TileColor]()
        colors.append(contentsOf: Array(repeating: TileColor.red, count: 9))
        colors.append(contentsOf: Array(repeating: TileColor.orange, count: 9))
        colors.append(contentsOf: Array(repeating: TileColor.blue, count: 9))
        colors.append(contentsOf: Array(repeating: TileColor.green, count: 9))
        colors.append(contentsOf: Array(repeating: TileColor.white, count: 9))
        colors.append(contentsOf: Array(repeating: TileColor.yellow, count: 9))
        colors.shuffle()

        for i in 0..<3 {
            for j in 0..<3 {
                cube[.front]?[i][j] = colors.removeLast()
                cube[.back]?[i][j] = colors.removeLast()
                cube[.left]?[i][j] = colors.removeLast()
                cube[.right]?[i][j] = colors.removeLast()
                cube[.top]?[i][j] = colors.removeLast()
                cube[.bottom]?[i][j] = colors.removeLast()
            }
        }
    }

    func rotateFace(direction: CubeRotation) {
        guard let selectedFace = selectedFace else { return }

        switch selectedFace {
            case .top:
                if direction == .clockwise {
                    rotateTopFaceClockwise()
                } else {
                    rotateTopFaceCounterClockwise()
                }

            case .bottom:
                if direction == .clockwise {
                    rotateBottomFaceClockwise()
                } else {
                    rotateBottomFaceCounterClockwise()
                }

            case .left:
                if direction == .clockwise {
                    rotateLeftFaceClockwise()
                } else {
                    rotateLeftFaceCounterClockwise()
                }

            case .right:
                if direction == .clockwise {
                    rotateRightFaceClockwise()
                } else {
                    rotateRightFaceCounterClockwise()
                }

            case .front:
                if direction == .clockwise {
                    rotateFrontFaceClockwise()
                } else {
                    rotateFrontFaceCounterClockwise()
                }

            case .back:
                if direction == .clockwise {
                    rotateBackFaceClockwise()
                } else {
                    rotateBackFaceCounterClockwise()
                }
        }
    }

    private func rotateRightFaceClockwise() {
        // Rotate the right face itself
        cube[.right] = cube[.right]?.rotate2DArray(clockwise: true)

        // Store current state
        let frontFace = (0..<3).map({ i in cube[.front]?[i][2] ?? .white })
        let bottomFace = (0..<3).map({ i in cube[.bottom]?[i][2] ?? .white })
        let topFace = (0..<3).map({ i in cube[.top]?[i][2] ?? .white })
        let backFace = (0..<3).map({ i in cube[.back]?[i][2] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[i][2] = bottomFace[i]
            cube[.top]?[i][2] = frontFace[i]
            cube[.back]?[i][2] = topFace[i]
            cube[.bottom]?[i][2] = backFace[i]
        }
    }

    private func rotateRightFaceCounterClockwise() {
        // Rotate the right face itself
        cube[.right] = cube[.right]?.rotate2DArray(clockwise: false)

        // Store current state
        let frontFace = (0..<3).map({ i in cube[.front]?[i][2] ?? .white })
        let bottomFace = (0..<3).map({ i in cube[.bottom]?[i][2] ?? .white })
        let topFace = (0..<3).map({ i in cube[.top]?[i][2] ?? .white })
        let backFace = (0..<3).map({ i in cube[.back]?[i][2] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[i][2] = topFace[i]
            cube[.top]?[i][2] = backFace[i]
            cube[.back]?[i][2] = bottomFace[i]
            cube[.bottom]?[i][2] = frontFace[i]
        }
    }

    private func rotateLeftFaceClockwise() {
        // Rotate the left face itself
        cube[.left] = cube[.left]?.rotate2DArray(clockwise: true)

        // Store current state
        let frontFace = (0..<3).map({ i in cube[.front]?[i][0] ?? .white })
        let bottomFace = (0..<3).map({ i in cube[.bottom]?[i][0] ?? .white })
        let topFace = (0..<3).map({ i in cube[.top]?[i][0] ?? .white })
        let backFace = (0..<3).map({ i in cube[.back]?[i][0] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[i][0] = topFace[i]
            cube[.top]?[i][0] = backFace[i]
            cube[.back]?[i][0] = bottomFace[i]
            cube[.bottom]?[i][0] = frontFace[i]
        }
    }

    private func rotateLeftFaceCounterClockwise() {
        // Rotate the left face itself
        cube[.left] = cube[.left]?.rotate2DArray(clockwise: false)
        
        // Store current state
        let frontFace = (0..<3).map({ i in cube[.front]?[i][0] ?? .white })
        let bottomFace = (0..<3).map({ i in cube[.bottom]?[i][0] ?? .white })
        let topFace = (0..<3).map({ i in cube[.top]?[i][0] ?? .white })
        let backFace = (0..<3).map({ i in cube[.back]?[i][0] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[i][0] = bottomFace[i]
            cube[.top]?[i][0] = frontFace[i]
            cube[.back]?[i][0] = topFace[i]
            cube[.bottom]?[i][0] = backFace[i]
        }
    }

    private func rotateTopFaceClockwise() {
        // Rotate the top face itself
        cube[.top] = cube[.top]?.rotate2DArray(clockwise: true)

        // Store current state
        let frontFace = (0..<3).map({ i in cube[.front]?[0][i] ?? .white })
        let rightFace = (0..<3).map({ i in cube[.right]?[0][i] ?? .white })
        let backFace = (0..<3).map({ i in cube[.back]?[0][i] ?? .white })
        let leftFace = (0..<3).map({ i in cube[.left]?[0][i] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[0][i] = rightFace[i]
            cube[.left]?[0][i] = frontFace[i]
            cube[.back]?[0][i] = leftFace[i]
            cube[.right]?[0][i] = backFace[i]
        }
    }

    private func rotateTopFaceCounterClockwise() {
        // Rotate the top face itself
        cube[.top] = cube[.top]?.rotate2DArray(clockwise: false)

        // Rotate the edges of adjacent faces
        let frontFace = (0..<3).map({ i in cube[.front]?[0][i] ?? .white })
        let rightFace = (0..<3).map({ i in cube[.right]?[0][i] ?? .white })
        let backFace = (0..<3).map({ i in cube[.back]?[0][i] ?? .white })
        let leftFace = (0..<3).map({ i in cube[.left]?[0][i] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[0][i] = leftFace[i]
            cube[.left]?[0][i] = backFace[i]
            cube[.back]?[0][i] = rightFace[i]
            cube[.right]?[0][i] = frontFace[i]
        }
    }

    private func rotateBottomFaceClockwise() {
        // Rotate the bottom face itself
        cube[.bottom] = cube[.bottom]?.rotate2DArray(clockwise: true)

        // Store current state
        let frontFace = (0..<3).map({ i in cube[.front]?[2][i] ?? .white })
        let rightFace = (0..<3).map({ i in cube[.right]?[2][i] ?? .white })
        let backFace = (0..<3).map({ i in cube[.back]?[2][i] ?? .white })
        let leftFace = (0..<3).map({ i in cube[.left]?[2][i] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[2][i] = rightFace[i]
            cube[.left]?[2][i] = frontFace[i]
            cube[.back]?[2][i] = leftFace[i]
            cube[.right]?[2][i] = backFace[i]
        }
    }

    private func rotateBottomFaceCounterClockwise() {
        // Rotate the bottom face itself
        cube[.bottom] = cube[.bottom]?.rotate2DArray(clockwise: false)

        // Store current state
        let frontFace = (0..<3).map({ i in cube[.front]?[2][i] ?? .white })
        let rightFace = (0..<3).map({ i in cube[.right]?[2][i] ?? .white })
        let backFace = (0..<3).map({ i in cube[.back]?[2][i] ?? .white })
        let leftFace = (0..<3).map({ i in cube[.left]?[2][i] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.front]?[2][i] = leftFace[i]
            cube[.left]?[2][i] = backFace[i]
            cube[.back]?[2][i] = rightFace[i]
            cube[.right]?[2][i] = frontFace[i]
        }
    }

    private func rotateFrontFaceClockwise() {
        // Rotate the front face itself
        cube[.front] = cube[.front]?.rotate2DArray(clockwise: true)

        // Store current state
        let bottomFace = (0..<3).map({ i in cube[.bottom]?[0][i] ?? .white })
        let rightFace = (0..<3).map({ i in cube[.right]?[i][0] ?? .white })
        let topFace = (0..<3).map({ i in cube[.top]?[2][i] ?? .white })
        let leftFace = (0..<3).map({ i in cube[.left]?[i][2] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.top]?[2][i] = leftFace[i]
            cube[.right]?[i][0] = topFace[i]
            cube[.bottom]?[0][i] = rightFace[i]
            cube[.left]?[i][2] = bottomFace[i]
        }
    }

    private func rotateFrontFaceCounterClockwise() {
        // Rotate the front face itself
        cube[.front] = cube[.front]?.rotate2DArray(clockwise: false)

        // Store current state
        let bottomFace = (0..<3).map({ i in cube[.bottom]?[0][i] ?? .white })
        let rightFace = (0..<3).map({ i in cube[.right]?[i][0] ?? .white })
        let topFace = (0..<3).map({ i in cube[.top]?[2][i] ?? .white })
        let leftFace = (0..<3).map({ i in cube[.left]?[i][2] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.top]?[2][i] = rightFace[i]
            cube[.right]?[i][0] = bottomFace[i]
            cube[.bottom]?[0][i] = leftFace[i]
            cube[.left]?[i][2] = topFace[i]
        }
    }

    private func rotateBackFaceClockwise() {
        // Rotate the front face itself
        cube[.back] = cube[.back]?.rotate2DArray(clockwise: true)

        // Store current state
        let bottomFace = (0..<3).map({ i in cube[.bottom]?[2][i] ?? .white })
        let rightFace = (0..<3).map({ i in cube[.right]?[i][2] ?? .white })
        let topFace = (0..<3).map({ i in cube[.top]?[0][i] ?? .white })
        let leftFace = (0..<3).map({ i in cube[.left]?[i][0] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.top]?[0][i] = leftFace[i]
            cube[.right]?[i][2] = topFace[i]
            cube[.bottom]?[2][i] = rightFace[i]
            cube[.left]?[i][0] = bottomFace[i]
        }
    }

    private func rotateBackFaceCounterClockwise() {
        // Rotate the back face itself
        cube[.back] = cube[.back]?.rotate2DArray(clockwise: false)

        // Store current state
        let bottomFace = (0..<3).map({ i in cube[.bottom]?[2][i] ?? .white })
        let rightFace = (0..<3).map({ i in cube[.right]?[i][2] ?? .white })
        let topFace = (0..<3).map({ i in cube[.top]?[0][i] ?? .white })
        let leftFace = (0..<3).map({ i in cube[.left]?[i][0] ?? .white })

        // Set new states
        for i in 0..<3 {
            cube[.top]?[0][i] = rightFace[i]
            cube[.right]?[i][2] = bottomFace[i]
            cube[.bottom]?[2][i] = leftFace[i]
            cube[.left]?[i][0] = topFace[i]
        }
    }
}
