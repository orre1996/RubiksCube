//
//  PrimaryButton.swift
//  RubiksCube
//
//  Created by Oscar Berggren on 2024-06-14.
//

import SwiftUI

struct PrimaryButton: View {
    @ScaledMetric private var scale: CGFloat = 1

    private let title: String
    private let icon: Image?
    private let action: () -> Void

    init(title: String, icon: Image? = nil, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
    }

    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(spacing: 8) {
                if let icon {
                    icon
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 16 * scale, height: 16 * scale)
                }

                if !title.isEmpty {
                    Text(title)
                        .animation(.none, value: UUID())
                }
            }
            .frame(minWidth: 60)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .contentShape(Rectangle())
            .foregroundStyle(Color.primaryButtonForegroundColor)
        })
        .background(Color.primaryButtonBackgroundColor)
        .cornerRadius(8)
    }
}

#Preview {
    PrimaryButton(title: "Button", action: { })
}
