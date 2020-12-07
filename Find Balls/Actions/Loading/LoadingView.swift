//
//  LoadingView.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 05.12.2020.
//

import SwiftUI

struct LoadingView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State private var loadingCompleted = false
    
    let firebaseManager: FirebaseManager
    
    init() {
        self.firebaseManager = FirebaseManager()
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                BackgroundUIView(imageName: ImageName.backgroundWithoutBallView, animationName: AnimationName.lightFallBig)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .edgesIgnoringSafeArea(.all)
            }
            
            LoadingContentView()
                .offset(x: loadingCompleted ? -Device.screenFrame.width : 0, y: 0)
            
            if UserDefaults.standard.bool(forKey: UserDataKey.getStarted) == false {
                WelcomeView()
                    .offset(x: loadingCompleted ? 0 : Device.screenFrame.width, y: 0)
            } else {
                ContentView()
                    .offset(x: loadingCompleted ? 0 : Device.screenFrame.width, y: 0)
            }
        }
        .preferredColorScheme(.dark)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    // Get Data
                    loadingCompleted = true
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.prepare()
                    generator.impactOccurred()
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
