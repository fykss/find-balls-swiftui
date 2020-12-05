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
    
    //    typealias UIViewType = UIView
    //
    //    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
    //        let view = UIView(frame: .zero)
    //
    //        let animationView = AnimationView()
    //        let animation = Animation.named(filename)
    //        animationView.animation = animation
    //        animationView.contentMode = .scaleAspectFit
    //        animationView.loopMode = loop ? .loop : .playOnce
    //        animationView.play()
    //
    //        animationView.translatesAutoresizingMaskIntoConstraints = false
    //        view.addSubview(animationView)
    //
    //        NSLayoutConstraint.activate([
    //            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
    //            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
    //        ])
    //
    //        return view
    //    }
    //
    //    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    //
    //    }
    
    func makeUIView(context: Context) -> AnimationView{
        
        let view = AnimationView(name: filename, bundle: Bundle.main)
        
        view.play()
        view.loopMode = loop ? .loop : .playOnce
        
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
        
    }
}
