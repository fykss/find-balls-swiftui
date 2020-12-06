//
//  LoadingContentView.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 05.12.2020.
//

import SwiftUI

struct LoadingContentView: View {
    var body: some View {
        ZStack {
            Text(LocalizedStringKey(LocalizableKeys.appName))
                .font(.custom(FontName.helveticaNeueBold, size: Size.titleFontSize))
                .foregroundColor(.white)
            VStack {
                Spacer()
                LottieView(filename: AnimationName.loading, loop: true)
                    .frame(width: animationSize, height: animationSize, alignment: .center)
            }
        }
        .animation(Animation.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 15, initialVelocity: 0))
        .padding()
    }
    
    let animationSize: CGFloat = 120
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            LoadingContentView()
        }
    }
}
