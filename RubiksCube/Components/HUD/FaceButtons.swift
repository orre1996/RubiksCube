//
//  FaceButtons.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

struct FaceButtons: View {
    private let columns = [GridItem(.flexible(minimum: 44, maximum: 999)),
                           GridItem(.flexible(minimum: 44, maximum: 999)),
                           GridItem(.flexible(minimum: 44, maximum: 999))]

    @Binding private var selectedFace: CubeFace?

    init(selectedFace: Binding<CubeFace?>) {
        _selectedFace = selectedFace
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0..<(CubeFace.titles.count), id: \.self) { index in
                if let currentFace = CubeFace(rawValue: index) {
                    ToggleButton(title: currentFace.title.capitalized,
                                 isSelected: selectedFace == currentFace,
                                 action: {
                        selectedFace = currentFace
                    })
                }
            }
        }
    }
}

#Preview {
    FaceButtons(selectedFace: .constant(nil))
}
