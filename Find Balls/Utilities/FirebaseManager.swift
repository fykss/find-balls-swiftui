//
//  FirebaseManager.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 06.12.2020.
//

import Foundation
import GameKit
import FirebaseAuth

class FirebaseManager {
    
    init() {
        self.authenticateUser()
    }
    
    private func authenticateUser() {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.local

        localPlayer.authenticateHandler = {(ViewController, error) -> Void in
            if ((ViewController) != nil) {
                print("User is not logged into game center")

            } else if (localPlayer.isAuthenticated) {
                // Player is already authenticated & logged in, load game center
                self.authenticateWithFirebaseGameCenter()
                return

            } else {
                // Game center is not enabled on the users device
                print("Local player could not be authenticated!")
                print(error ?? "error2")
            }
        }
    }
    
    private func authenticateWithFirebaseGameCenter() {
        GameCenterAuthProvider.getCredential() { (credential, error) in
            if let error = error {
//                Service.showAlert(on: self, style: .alert, title: "Error 2", message: error.localizedDescription)
                print("ERROR 1: \(error.localizedDescription)")
                return
            }
            
            Auth.auth().signIn(with:credential!) { (user, error) in
                if let error = error {
//                    Service.showAlert(on: self, style: .alert, title: "Error 3", message: error.localizedDescription)
                    print("ERROR 2: \(error.localizedDescription)")
                    return
                }
                
                guard let uid = Auth.auth().currentUser?.uid else { return }
                guard let username = Auth.auth().currentUser?.displayName else { return }
                
                print(uid, username)
                
//                FirestoreReferenceManager.referenceForUserPublicData(uid: uid).setData(userData as [String : Any]) { (error) in
//                    if error != nil {
//                        return
//                    }
//                }
                
                
            }
        }
    }
}
