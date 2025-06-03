//
//  AdaptableHeightModifier.swift
//  EasyBudget
//
//  Created by zang qilong on 2025/3/6.
//

import Foundation
import SwiftUI

struct AdaptableHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}

struct AdaptableHeightModifier: ViewModifier {
    @State private var currentHeight: CGFloat = 0
    let color: Color
    let cornerRadius: CGFloat
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: AdaptableHeightPreferenceKey.self, value: geometry.size.height)
        }
    }

    func body(content: Content) -> some View {
        content
            .background(sizeView)
            .onPreferenceChange(AdaptableHeightPreferenceKey.self) { height in
                if let height {
                    currentHeight = height
                }
            }
            .presentationDetents([.height(currentHeight)])
            .presentationBackground(color)
            .presentationCornerRadius(cornerRadius)
    }
}

public extension View {
    @ViewBuilder
    func autoAdaptableHeight(backgroundColor: Color, cornerRadius: CGFloat) -> some View {
        self.modifier(AdaptableHeightModifier(color: backgroundColor, cornerRadius: cornerRadius))
    }
}
