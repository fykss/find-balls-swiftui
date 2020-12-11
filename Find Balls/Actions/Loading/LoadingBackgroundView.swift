//
//  LoadingBackgroundView.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 11.12.2020.
//

import SwiftUI

struct LoadingBackgroundView: View {
    var body: some View {
        GeometryReader { geometry in
            BackgroundUIView(imageName: ImageName.backgroundWithoutBallView, animationName: AnimationName.lightFallBig)
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            
            VisualEffectView(effect: UIBlurEffect(style: .dark))
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LoadingBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBackgroundView()
    }
}
