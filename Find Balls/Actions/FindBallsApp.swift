//
//  FindBallsApp.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 06.12.2020.
//

import SwiftUI

struct FindBallsApp: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    private let transitionLeading = AnyTransition.move(edge: .leading)
    private let transitionTrailing = AnyTransition.move(edge: .trailing)
    
    var body: some View {
        switch viewRouter.currentScreen {
        case .loading:
            LoadingView()
        case .home:
            withAnimation {
                ContentView()
            }
            .transition(.asymmetric(insertion: transitionTrailing, removal: transitionLeading))
        }
    }
}

struct FindBallsApp_Previews: PreviewProvider {
    static var previews: some View {
        FindBallsApp().environmentObject(ViewRouter())
    }
}
