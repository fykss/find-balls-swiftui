//
//  File.swift
//  find-balls
//
//  Created by Vladyslav Lietun on 01.12.2020.
//

import SwiftUI

// MARK: - VisualEffectBlur

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
