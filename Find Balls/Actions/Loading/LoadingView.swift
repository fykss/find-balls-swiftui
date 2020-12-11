//
//  LoadingView.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 05.12.2020.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var loadingCompleted = false
    
    @ObservedObject var viewModel = LoadingViewModel()
    
    var body: some View {
        ZStack {
            LoadingBackgroundView()
            
            GKAuthenticationView { (state) in
                if state != .succeeded { self.viewModel.showModal = true }

            } failed: { (error) in
                self.viewModel.showAlert(title: "Authentication Failed", message: error.localizedDescription)
                // Notify anonymous user
                // TODO: Auth anonymously
            } authenticated: { (playerName) in
                loadingCompleted = true
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.prepare()
                generator.impactOccurred()
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
            self.viewModel.load()
        }
        .sheet(isPresented: self.$viewModel.showModal) {
            if self.viewModel.activeSheet == .authentication {
                GKAuthenticationView { (state) in
                    switch state {
                    case .started:
                        break
                    case .failed:
                        break
                    case .deauthenticated:
                        break
                    case .succeeded:
                        break
                    }
                } failed: { (error) in
                    self.viewModel.showAlert(title: "Authentication Failed", message: error.localizedDescription)
                } authenticated: { (playerName) in
                    self.viewModel.showModal = false
                    loadingCompleted = true
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.prepare()
                    generator.impactOccurred()
                }
            }
        }
        .alert(isPresented: self.$viewModel.showAlert) {
            Alert(title: Text(self.viewModel.alertTitle),
                  message: Text(self.viewModel.alertMessage),
                  dismissButton: .default(Text("Ok")))
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
