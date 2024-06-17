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
            ForEach(CubeFace.titles, id: \.self) { title in
                if let currentFace = CubeFace(rawValue: title.lowercased()) {
                    ToggleButton(title: currentFace.rawValue.capitalized,
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
