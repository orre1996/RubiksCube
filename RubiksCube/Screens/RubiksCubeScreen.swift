//
//  RubiksCubeScreen.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

struct RubiksCubeScreen: View {
    @State private var viewModel = RubiksCubeViewModel()
    @State private var isIsometricCubeSelected = true

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 16) {
                CubeActionButtons(isIsometricCubeSelected: $isIsometricCubeSelected, resetCube: {
                    viewModel.resetCube()
                }, shuffleCube: {
                    viewModel.shuffleCube()
                })

                GeometryReader { geometryProxy in
                    if isIsometricCubeSelected {
                        IsometricCubeView(cube: viewModel.cube, geometryProxy: geometryProxy)
                    } else {
                        FlatCubeView(cube: viewModel.cube, geometryProxy: geometryProxy)
                    }
                }

                FaceButtons(selectedFace: $viewModel.selectedFace)

                RotationButtons(rotationAction: { direction in
                    viewModel.rotateFace(direction: direction)
                })
            }
            .padding(16)
        }
    }
}

#Preview {
    RubiksCubeScreen()
}
