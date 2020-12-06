//
//  ViewRouter.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 06.12.2020.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentScreen: ViewRouterScreenName = .loading
}

enum ViewRouterScreenName {
    case loading
    case home
}
