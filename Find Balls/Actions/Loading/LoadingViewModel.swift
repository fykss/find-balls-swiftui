//
//  LoadingViewModel.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 06.12.2020.
//

import Foundation
import Combine

class LoadingViewModel: ObservableObject {

    @Published public var activeSheet :ContentViewSheet = .authentication
    @Published public var showModal = false
    @Published public var showAlert = false
    @Published public var alertTitle: String = ""
    @Published public var alertMessage: String = ""

    public init() {
    }
    
    public func load() {
        self.showAuthenticationModal()
    }

    public func showAlert(title: String, message: String) {
        self.showAlert = true
        self.alertTitle = title
        self.alertMessage = message
    }

    public func showAuthenticationModal() {
        self.activeSheet = .authentication
    }
}

public enum ContentViewSheet {
    case authentication
}
