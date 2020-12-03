//
//  HomeView.swift
//  find-balls
//
//  Created by Vladyslav Lietun on 01.12.2020.
//

import SwiftUI
import UIKit

struct WelcomeView: View {
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            BackgroundView(imageName: ImageName.backgroundWithoutBallView, blur: true, blurStyle: .dark, animationName: AnimationName.lightFall)
            
            VStack {
                Text("Find Balls")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text("Find Ball")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
