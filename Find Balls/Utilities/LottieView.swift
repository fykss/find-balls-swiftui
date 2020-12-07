//
//  LottieView.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 05.12.2020.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var filename: String
    var loop: Bool
    
    func makeUIView(context: Context) -> AnimationView {
        let view = AnimationView(name: filename, bundle: Bundle.main)
        
        view.play()
        view.loopMode = loop ? .loop : .playOnce
        
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
     
    }
}
