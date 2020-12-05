//
//  ContentView.swift
//  find-balls
//
//  Created by Vladyslav Lietun on 24.11.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        CustomTabView()
//            .navigationBarHidden(true)
        WelcomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabView: View {
    
    @State var selectedTab = "house"
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {

            ZStack {
                WelcomeView()
//                Email()
//                Settings()
            }
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    
                    if image != tabs.last {
                        Spacer(minLength: 0)
                    }
                }
            }
            .zIndex(1)
            .padding(.horizontal, 25)
            .padding(.vertical, 5)
            .background(
                VisualEffectView(effect: UIBlurEffect(style: .light))
            )
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal)
            .padding(.bottom, 20)
        })
    }
}

var tabs = ["house", "book.closed", "person.crop.circle"]

struct TabButton: View {
    
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {selectedTab = image}, label: {
            Image(systemName: image)
                .renderingMode(.template)
                .foregroundColor(selectedTab == image ? Color.blue : Color.black.opacity(0.9))
                .padding()
        })
    }
}

struct Email: View {
    var body: some View {
        Text("Email")
    }
}

struct Settings: View {
    var body: some View {
        Text("Settings")
    }
}
