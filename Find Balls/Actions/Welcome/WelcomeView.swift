//
//  HomeView.swift
//  find-balls
//
//  Created by Vladyslav Lietun on 01.12.2020.
//

import SwiftUI
import UIKit

struct WelcomeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        
        VStack {
            Spacer()
            Text(LocalizedStringKey(LocalizableKeys.welcomeTitle))
                .font(.custom(FontName.helveticaNeueBold, size: Size.titleFontSize))
                .foregroundColor(.white)
            
            Text(LocalizedStringKey(LocalizableKeys.welcomeDescription))
                .font(.custom(FontName.helveticaNeueBold, size: Size.defaultFontSize))
                .foregroundColor(.customLightGray)
                .padding(.top)
                .padding(.horizontal, 25)
            
            Button(action: {
                withAnimation {
                    viewRouter.currentScreen = .home
                }
            }, label: {
                Text(LocalizedStringKey(LocalizableKeys.welcomeTitleButton))
                    .font(.custom(FontName.helveticaNeueBold, size: Size.defaultFontSize))
            })
            .buttonStyle(GradientButtonStyle(colors: [Color.purpleGradientDark, Color.purpleGradientLight], width: Size.buttonWidth, height: Size.buttonHeight))
            .padding(.top)
            
            Text(LocalizedStringKey(LocalizableKeys.welcomePrivacy))
                .font(.footnote)
                .foregroundColor(.customLightGray)
                .padding(.top)
                .padding(.horizontal, 25)
        }
        .padding(.horizontal)
        .padding(.bottom)
        .animation(Animation.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 15, initialVelocity: 0))
        .frame(width: Device.isIphone ? Device.screenFrame.width : Device.screenFrame.width / 1.5)
        .multilineTextAlignment(.center)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            WelcomeView()
        }
    }
}
