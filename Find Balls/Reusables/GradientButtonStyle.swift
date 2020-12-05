//
//  GradientButtonStyle.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 03.12.2020.
//

import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    var colors: [Color]
    var width: CGFloat
    var height: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height)
            .background(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(height / 2)
            .foregroundColor(.white)
    }
}
