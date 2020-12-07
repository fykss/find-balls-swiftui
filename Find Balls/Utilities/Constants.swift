//
//  Constants.swift
//  find-balls
//
//  Created by Vladyslav Lietun on 01.12.2020.
//

import Foundation
import SwiftUI
import JGProgressHUD

struct Test {
    static let run = true
}

struct ImageName {
    /// Backgrounds
    static let backgroundWithoutBallView = "soccer-background"
}

struct Device {
    static let edgeInsets = UIApplication.shared.windows.first?.safeAreaInsets
    static let screenFrame = UIScreen.main.bounds
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
}

struct Size {
    static let buttonHeight: CGFloat = 50.0
    static let buttonWidth: CGFloat = Device.isIphone ? Device.screenFrame.width * 0.9 : Device.screenFrame.width / 1.5
    static let defaultFontSize: CGFloat = Device.isIphone ? 16.0 : 18.0
    static let titleFontSize: CGFloat = Device.isIphone ? 40.0 : 45.0
}

struct AnimationName {
    static let lightFall = "LightFall.sks"
    static let lightFallBig = "LightFallBig.sks"
    static let loading = "Loading"
}

struct FontName {
    static let helveticaNeue = "Helvetica Neue"
    static let helveticaNeueBold = "Helvetica Neue Bold"
}

struct UserDataKey {
    static let getStarted = "getStarted"
}

struct Service {
    static func showAlert(on: UIViewController, style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .default, handler: nil)], completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        on.present(alert, animated: true, completion: completion)
    }
    
    static func dismissHud(_ hud: JGProgressHUD, text: String, detailText: String, delay: TimeInterval) {
        hud.textLabel.text = text
        hud.detailTextLabel.text = detailText
        hud.dismiss(afterDelay: delay, animated: true)
    }
}
