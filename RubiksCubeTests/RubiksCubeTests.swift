//
//  RubiksCubeTests.swift
//  RubiksCubeTests
//
//  Created by Oscar Berggren on 2024-06-14.
//

import XCTest
@testable import RubiksCube

final class RubiksCubeTests: XCTestCase {
    private let viewModel = RubiksCubeViewModel()

    func testTopClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .top
        viewModel.rotateFace(direction: .clockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .clockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }
    
    func testTopCounterClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .top
        viewModel.rotateFace(direction: .counterClockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .counterClockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testBottomClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .bottom
        viewModel.rotateFace(direction: .clockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .clockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testBottomCounterClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .bottom
        viewModel.rotateFace(direction: .counterClockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .counterClockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testLeftClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .left
        viewModel.rotateFace(direction: .clockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .clockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testLeftCounterClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .left
        viewModel.rotateFace(direction: .counterClockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .counterClockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testRightClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .right
        viewModel.rotateFace(direction: .clockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .clockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testRightCounterClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .right
        viewModel.rotateFace(direction: .counterClockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .counterClockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testFrontClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .front
        viewModel.rotateFace(direction: .clockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .clockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testFrontCounterClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .front
        viewModel.rotateFace(direction: .counterClockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .counterClockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testBackClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .back
        viewModel.rotateFace(direction: .clockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .clockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testBackCounterClockwiseRotation() {
        let initialCube = viewModel.cube

        viewModel.selectedFace = .back
        viewModel.rotateFace(direction: .counterClockwise)

        XCTAssertNotEqual(initialCube, viewModel.cube)

        for _ in 0..<3 {
            viewModel.rotateFace(direction: .counterClockwise)
        }

        XCTAssertEqual(initialCube, viewModel.cube)
    }

    func testRightTopBottomBackRotationCombination() {
        viewModel.selectedFace = .right
        viewModel.rotateFace(direction: .clockwise)

        viewModel.selectedFace = .top
        viewModel.rotateFace(direction: .clockwise)

        viewModel.selectedFace = .bottom
        viewModel.rotateFace(direction: .clockwise)
        viewModel.rotateFace(direction: .counterClockwise)

        viewModel.selectedFace = .back
        viewModel.rotateFace(direction: .clockwise)
        
        let frontFirstRow = viewModel.cube[.front]?[0]
        XCTAssertEqual(frontFirstRow, [.green, .green, .green])
        
        let topFirstColumn = [viewModel.cube[.top]![0][0],
                              viewModel.cube[.top]![1][0],
                              viewModel.cube[.top]![2][0]]

        XCTAssertEqual(topFirstColumn, [.orange, .white, .red])
    }

    func testLeftBackFrontRightRotationCombinations() {
        viewModel.selectedFace = .left
        viewModel.rotateFace(direction: .clockwise)

        viewModel.selectedFace = .back
        viewModel.rotateFace(direction: .clockwise)

        viewModel.selectedFace = .front
        viewModel.rotateFace(direction: .counterClockwise)
        viewModel.rotateFace(direction: .counterClockwise)

        viewModel.selectedFace = .right
        viewModel.rotateFace(direction: .clockwise)
        
        let backLastRow = viewModel.cube[.back]?[2]
        XCTAssertEqual(backLastRow, [.green, .yellow, .yellow])
        
        let leftSecondColumn = [viewModel.cube[.left]![0][0],
                                viewModel.cube[.left]![1][0],
                                viewModel.cube[.left]![2][0]]

        XCTAssertEqual(leftSecondColumn, [.white, .white, .orange])
    }
}
