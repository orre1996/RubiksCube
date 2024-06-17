//
//  ToggleButton.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

struct ToggleButton: View {
    private let title: String
    private let isSelected: Bool
    private let action: () -> Void

    init(title: String, isSelected: Bool, action: @escaping () -> Void) {
        self.title = title
        self.isSelected = isSelected
        self.action = action
    }

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .foregroundStyle(isSelected ? Color.primaryButtonBackgroundColor : Color.primaryButtonForegroundColor)
                .frame(minWidth: 60)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .contentShape(Rectangle())
        })
        .background(isSelected ? Color.primaryButtonForegroundColor : Color.primaryButtonBackgroundColor)
        .cornerRadius(8)
    }
}

#Preview {
    ToggleButton(title: "Button", isSelected: false, action: { })
}
