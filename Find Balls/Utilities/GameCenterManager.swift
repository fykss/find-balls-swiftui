//
//  GameCenterManager.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 06.12.2020.
//

import Foundation
import GameKit

class GameCenterManager {
    var gcEnabled = Bool() // Check if the user has Game Center enabled
    
    // MARK: - AUTHENTICATE LOCAL PLAYER
    func authenticateLocalPlayer() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.local

        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if ((ViewController) != nil) {
                print("User is not logged into game center")

            } else if (localPlayer.isAuthenticated) {
                // 2. Player is already authenticated & logged in, load game center
                self.gcEnabled = true

            } else {
                // 3. Game center is not enabled on the users device
                self.gcEnabled = false
                print("Local player could not be authenticated!")
                print(error ?? "error2")
            }
        }
    }
}


