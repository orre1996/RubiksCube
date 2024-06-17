//
//  RotationButtons.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

struct RotationButtons: View {
    private let rotationAction: (CubeRotation) -> Void

    init(rotationAction: @escaping (CubeRotation) -> Void) {
        self.rotationAction = rotationAction
    }

    var body: some View {
        HStack(spacing: 16) {
            PrimaryButton(title: "",
                          icon: CubeRotation.counterClockwise.icon,
                          action: {
                rotationAction(.counterClockwise)
            })

            PrimaryButton(title: "",
                          icon: CubeRotation.clockwise.icon,
                          action: {
                rotationAction(.clockwise)
            })
        }
    }
}

#Preview {
    RotationButtons(rotationAction: { _ in })
}
