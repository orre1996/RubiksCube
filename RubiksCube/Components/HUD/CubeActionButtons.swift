//
//  CubeActionButtons.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

struct CubeActionButtons: View {
    @Binding private var isIsometricCubeSelected: Bool

    private let resetCube: () -> Void
    private let shuffleCube: () -> Void

    init(isIsometricCubeSelected: Binding<Bool>, resetCube: @escaping () -> Void, shuffleCube: @escaping () -> Void) {
        _isIsometricCubeSelected = isIsometricCubeSelected
        self.resetCube = resetCube
        self.shuffleCube = shuffleCube
    }

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            PrimaryButton(title: "Reset", action: {
                resetCube()
            })

            Spacer(minLength: 8)

            PrimaryButton(title: isIsometricCubeSelected ? "Flat cube" : "Isometric cube", action: {
                isIsometricCubeSelected.toggle()
            })

            Spacer(minLength: 8)

            PrimaryButton(title: "Shuffle", action: {
                shuffleCube()
            })
        }
    }
}

#Preview {
    CubeActionButtons(isIsometricCubeSelected: .constant(true), resetCube: { }, shuffleCube: { })
}
