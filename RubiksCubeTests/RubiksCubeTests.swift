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
        var cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][0], TileColor.red)
        XCTAssertEqual(cube[.front]?[0][1], TileColor.red)
        XCTAssertEqual(cube[.front]?[0][2], TileColor.red)

        viewModel.selectedFace = .top
        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][0], TileColor.green)
        XCTAssertEqual(cube[.front]?[0][1], TileColor.green)
        XCTAssertEqual(cube[.front]?[0][2], TileColor.green)

        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.right]?[0][0], TileColor.blue)
        XCTAssertEqual(cube[.right]?[0][1], TileColor.blue)
        XCTAssertEqual(cube[.right]?[0][2], TileColor.blue)
    }
    
    func testTopCounterClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][0], TileColor.red)
        XCTAssertEqual(cube[.front]?[0][1], TileColor.red)
        XCTAssertEqual(cube[.front]?[0][2], TileColor.red)

        viewModel.selectedFace = .top
        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][0], TileColor.blue)
        XCTAssertEqual(cube[.front]?[0][1], TileColor.blue)
        XCTAssertEqual(cube[.front]?[0][2], TileColor.blue)

        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.right]?[0][0], TileColor.blue)
        XCTAssertEqual(cube[.right]?[0][1], TileColor.blue)
        XCTAssertEqual(cube[.right]?[0][2], TileColor.blue)
    }

    func testBottomClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[2][0], TileColor.red)
        XCTAssertEqual(cube[.front]?[2][1], TileColor.red)
        XCTAssertEqual(cube[.front]?[2][2], TileColor.red)

        viewModel.selectedFace = .bottom
        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[2][0], TileColor.blue)
        XCTAssertEqual(cube[.front]?[2][1], TileColor.blue)
        XCTAssertEqual(cube[.front]?[2][2], TileColor.blue)

        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.right]?[2][0], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][1], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][2], TileColor.blue)
    }

    func testBottomCounterClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[2][0], TileColor.red)
        XCTAssertEqual(cube[.front]?[2][1], TileColor.red)
        XCTAssertEqual(cube[.front]?[2][2], TileColor.red)

        viewModel.selectedFace = .bottom
        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[2][0], TileColor.green)
        XCTAssertEqual(cube[.front]?[2][1], TileColor.green)
        XCTAssertEqual(cube[.front]?[2][2], TileColor.green)

        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.right]?[2][0], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][1], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][2], TileColor.blue)
    }

    func testLeftClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][0], TileColor.red)
        XCTAssertEqual(cube[.front]?[1][0], TileColor.red)
        XCTAssertEqual(cube[.front]?[2][0], TileColor.red)

        viewModel.selectedFace = .left
        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][0], TileColor.white)
        XCTAssertEqual(cube[.front]?[1][0], TileColor.white)
        XCTAssertEqual(cube[.front]?[2][0], TileColor.white)

        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.bottom]?[0][0], TileColor.white)
        XCTAssertEqual(cube[.bottom]?[1][0], TileColor.white)
        XCTAssertEqual(cube[.bottom]?[2][0], TileColor.white)
    }

    func testLeftCounterClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][0], TileColor.red)
        XCTAssertEqual(cube[.front]?[1][0], TileColor.red)
        XCTAssertEqual(cube[.front]?[2][0], TileColor.red)

        viewModel.selectedFace = .left
        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][0], TileColor.yellow)
        XCTAssertEqual(cube[.front]?[1][0], TileColor.yellow)
        XCTAssertEqual(cube[.front]?[2][0], TileColor.yellow)

        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.bottom]?[0][0], TileColor.white)
        XCTAssertEqual(cube[.bottom]?[1][0], TileColor.white)
        XCTAssertEqual(cube[.bottom]?[2][0], TileColor.white)
    }

    func testRightClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][2], TileColor.red)
        XCTAssertEqual(cube[.front]?[1][2], TileColor.red)
        XCTAssertEqual(cube[.front]?[2][2], TileColor.red)

        viewModel.selectedFace = .right
        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][2], TileColor.yellow)
        XCTAssertEqual(cube[.front]?[1][2], TileColor.yellow)
        XCTAssertEqual(cube[.front]?[2][2], TileColor.yellow)

        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.bottom]?[0][2], TileColor.white)
        XCTAssertEqual(cube[.bottom]?[1][2], TileColor.white)
        XCTAssertEqual(cube[.bottom]?[2][2], TileColor.white)
    }

    func testRightCounterClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][2], TileColor.red)
        XCTAssertEqual(cube[.front]?[1][2], TileColor.red)
        XCTAssertEqual(cube[.front]?[2][2], TileColor.red)

        viewModel.selectedFace = .right
        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.front]?[0][2], TileColor.white)
        XCTAssertEqual(cube[.front]?[1][2], TileColor.white)
        XCTAssertEqual(cube[.front]?[2][2], TileColor.white)

        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.bottom]?[0][2], TileColor.white)
        XCTAssertEqual(cube[.bottom]?[1][2], TileColor.white)
        XCTAssertEqual(cube[.bottom]?[2][2], TileColor.white)
    }

    func testFrontClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.top]?[2][0], TileColor.white)
        XCTAssertEqual(cube[.top]?[2][0], TileColor.white)
        XCTAssertEqual(cube[.top]?[2][0], TileColor.white)

        viewModel.selectedFace = .front
        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.top]?[2][0], TileColor.blue)
        XCTAssertEqual(cube[.top]?[2][0], TileColor.blue)
        XCTAssertEqual(cube[.top]?[2][0], TileColor.blue)

        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.right]?[2][0], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][0], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][0], TileColor.blue)
    }

    func testFrontCounterClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.top]?[2][0], TileColor.white)
        XCTAssertEqual(cube[.top]?[2][0], TileColor.white)
        XCTAssertEqual(cube[.top]?[2][0], TileColor.white)

        viewModel.selectedFace = .front
        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.top]?[2][0], TileColor.green)
        XCTAssertEqual(cube[.top]?[2][0], TileColor.green)
        XCTAssertEqual(cube[.top]?[2][0], TileColor.green)

        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.right]?[2][0], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][0], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][0], TileColor.blue)
    }

    func testBackClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.top]?[0][0], TileColor.white)
        XCTAssertEqual(cube[.top]?[0][1], TileColor.white)
        XCTAssertEqual(cube[.top]?[0][2], TileColor.white)

        viewModel.selectedFace = .back
        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.top]?[0][0], TileColor.green)
        XCTAssertEqual(cube[.top]?[0][1], TileColor.green)
        XCTAssertEqual(cube[.top]?[0][2], TileColor.green)

        viewModel.rotateFace(direction: .clockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.right]?[0][2], TileColor.blue)
        XCTAssertEqual(cube[.right]?[1][2], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][2], TileColor.blue)
    }

    func testBackCounterClockwiseRotation() {
        var cube = viewModel.cube

        XCTAssertEqual(cube[.top]?[0][0], TileColor.white)
        XCTAssertEqual(cube[.top]?[0][1], TileColor.white)
        XCTAssertEqual(cube[.top]?[0][2], TileColor.white)

        viewModel.selectedFace = .back
        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.top]?[0][0], TileColor.blue)
        XCTAssertEqual(cube[.top]?[0][1], TileColor.blue)
        XCTAssertEqual(cube[.top]?[0][2], TileColor.blue)

        viewModel.rotateFace(direction: .counterClockwise)
        cube = viewModel.cube

        XCTAssertEqual(cube[.right]?[0][2], TileColor.blue)
        XCTAssertEqual(cube[.right]?[1][2], TileColor.blue)
        XCTAssertEqual(cube[.right]?[2][2], TileColor.blue)
    }
}
