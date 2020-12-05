//
//  Background.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 02.12.2020.
//

import SwiftUI
import UIKit
import SpriteKit

struct BackgroundUIView: UIViewRepresentable {

    let imageName: String
    let animationName: String?
    
    func makeUIView(context: Context) -> some UIView {
        let backgroundView = UIImageView(image: UIImage(named: imageName))
        
        backgroundView.contentMode = .scaleAspectFill
        
        if animationName != nil {
            let lightFallAnimationView = UIView()
            lightFallAnimationView.contentMode = .scaleToFill
            lightFallAnimationView.frame.size.width = backgroundView.frame.width
            lightFallAnimationView.frame.size.height = backgroundView.frame.height / 2
            
            let sk: SKView = SKView()
            sk.frame = lightFallAnimationView.bounds
            sk.backgroundColor = .clear
            lightFallAnimationView.addSubview(sk)
            
            let scene: SKScene = SKScene(size: lightFallAnimationView.bounds.size)
            scene.scaleMode = .aspectFit
            scene.backgroundColor = .clear
            
            let en = SKEmitterNode(fileNamed: animationName ?? AnimationName.lightFallBig)
            en?.position = sk.center
            
            scene.addChild(en!)
            sk.presentScene(scene)
            
            backgroundView.addSubview(lightFallAnimationView)
        }
        
        return backgroundView
    }
    
    fileprivate func startLightFallAnimation() {
        
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

