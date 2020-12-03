//
//  BackgroundView.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 02.12.2020.
//

import SwiftUI

struct BackgroundView: View {
    
    let imageName: String
    let blur: Bool
    let blurStyle: UIBlurEffect.Style?
    let animationName: String?
    
    var body: some View {
        BackgroundUIView(imageName: imageName, blur: blur, blurStyle: blurStyle, animationName: animationName)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(imageName: ImageName.backgroundWithoutBallView, blur: true, blurStyle: .dark, animationName: AnimationName.lightFallBig)
    }
}
