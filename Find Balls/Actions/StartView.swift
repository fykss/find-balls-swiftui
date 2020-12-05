//
//  StartView.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 05.12.2020.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                BackgroundUIView(imageName: ImageName.backgroundWithoutBallView, animationName: AnimationName.lightFallBig)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .edgesIgnoringSafeArea(.all)
            }
            
            LoadingView()
        }
        .preferredColorScheme(.dark)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
