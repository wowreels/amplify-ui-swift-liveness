//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

import SwiftUI

struct InstructionView: View {
    let text: String
    let backgroundColor: Color
    var textColor: Color = .livenessLabel
    var font: Font = .body
    var showLoading: Bool = false
    
    var body: some View {
        HStack(spacing: 12) {
            if showLoading {
                LoaderView()
                    .padding(.leading, 16)
            }
            
            Text(text)
                .foregroundColor(textColor)
                .font(font)
                .padding(.trailing, 16)
                .padding(.vertical, 9)
                .padding(.leading, showLoading ? 0 : 16)
        }
        .background(backgroundColor)
        .cornerRadius(12)

    }
}


struct LoaderView: View {
    @State private var isAnimating = false
    var diameter: CGFloat = 20
    var lineWidth: CGFloat = 2
    var progressColor: Color = .black
    var ringColor: Color = .black.opacity(0.5)
    var body: some View {
        ZStack {
            // Background ring
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundColor(ringColor)

            Circle()
                .trim(from: 0, to: 0.25)
                .stroke(style: StrokeStyle(lineWidth: lineWidth,
                                           lineCap: .round))
                .foregroundColor(progressColor)
                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
        }
        .frame(width: diameter, height: diameter)
        .onAppear {
            isAnimating = true
        }
        .ignoresSafeArea()
    }
}
