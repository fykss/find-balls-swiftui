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
    
    var user: User?
    
    var username = ""
    var uniqueUsernames = [String]()
    
    init() {
//        self.authenticateUser()
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
                
                FirestoreReferenceManager.referenceForUserData(uid: uid).getDocument{ (document, error) in
                    
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    
                    if let document = document, !document.exists {
                        
                        let date = Date()
                        let format = DateFormatter()
                        format.dateFormat = "MM/dd/yyyy HH:mm:ss"
                        let formattedDate = format.date(from: format.string(from: date))
                        
                        if self.username.isEmpty {
                            self.generateUsername()
                        }
                        
                        self.user!.email = ""
                        self.user!.username = self.username
                        self.user!.date = formattedDate!
                        
//                        self.currentUser.currencyBalls = DefaultValues.defaultCurrencyBalls
//                        self.currentUser.currencyCups = DefaultValues.defaultCurrencyCups
//                        self.currentUser.currencyMedic = DefaultValues.defaultCurrenctMedic
//
//                        var firstChallangesData = [[String: Any]]()
//
//                        for challenge in self.challenges {
//                            let challengeData = [
//                                "\(challenge.challengeId)": [
//                                    DatabaseField.challengeId: challenge.challengeId,
//                                    DatabaseField.challengeName: challenge.challengeName,
//                                    DatabaseField.maxScore: 0,
//                                    DatabaseField.lock: challenge.lock,
//                                    DatabaseField.bonus2x: false,
//                                ]
//                            ]
//
//                            firstChallangesData.append(challengeData)
//                            self.currentUser.challengesCurrentUser.append(challengeData)
//                            self.currentUser.challengesMaxScores["\(challenge.challengeId)"] = 0
//                            self.currentUser.challengesLock["\(challenge.challengeId)"] = challenge.lock
//                            self.currentUser.challengesBonus2x["\(challenge.challengeId)"] = false
//
//                            let challengeStatistics = [
//                                DatabaseField.averageScore: 0.0,
//                                DatabaseField.gameCounter: 0,
//                                DatabaseField.scores: [[String: Int]](),
//                            ] as [String : Any]
//
//                            FirestoreReferenceManager.referenceForUserStatistics(uid: uid, challengeId: "\(challenge.challengeId)").setData(challengeStatistics)
//                        }
                        
//                        let data = [
//                            DatabaseField.currencyBalls: DefaultValues.defaultCurrencyBalls,
//                            DatabaseField.currencyCups: DefaultValues.defaultCurrencyCups,
//                            DatabaseField.currencyMedic: DefaultValues.defaultCurrenctMedic,
//                            DatabaseField.userName: self.username,
//                            DatabaseField.email: "",
//                            DatabaseField.secretKey: "",
//                            DatabaseField.challenges: firstChallangesData,
//                            DatabaseField.uid: uid,
//                            DatabaseField.date: formattedDate,
//                            DatabaseField.totalGameCounter: 0,
//                            DatabaseField.gameCheckpoints: [[formattedDate.split(separator: " ")[0]: 0]],
//                            DatabaseField.daySequence: 1,
//                            DatabaseField.lastDayGift: "",
//                            DatabaseField.activities: [String](),
//                        ] as [String : Any]
                        
//                        FirestoreReferenceManager.referenceForUserData(uid: uid).setData(from: user)
                        
                        if !self.uniqueUsernames.isEmpty {
                            FirestoreReferenceManager.referenceForRoot().updateData([DatabaseFields.uniqueUsernames: self.uniqueUsernames])
                        }
                        
                    } else if let document = document, document.exists {
                        
                        
                        //                    if userData![DatabaseField.secretKey] as? String == nil {
                        //                        FirestoreReferenceManager.referenceForUserData(uid: uid).updateData([DatabaseField.secretKey: ""])
                        //                    }
                        
//                        self.currentUser.currencyBalls = userData![DatabaseField.currencyBalls]! as! Int
//                        self.currentUser.currencyCups = userData![DatabaseField.currencyCups]! as! Int
//                        self.currentUser.currencyMedic = userData![DatabaseField.currencyMedic]! as! Int
//                        self.currentUser.email = userData![DatabaseField.email]! as! String
//                        self.currentUser.username = userData![DatabaseField.userName]! as! String
//                        self.currentUser.secretKey = userData![DatabaseField.secretKey]! as! String
//                        self.currentUser.uid = userData![DatabaseField.uid]! as! String
//                        self.currentUser.totalGameCounter = userData![DatabaseField.totalGameCounter]! as! Int
//                        self.currentUser.gameCheckpoints = userData![DatabaseField.gameCheckpoints]! as! [[String: Int]]
//                        self.currentUser.daySequence = userData![DatabaseField.daySequence]! as! Int
//                        self.currentUser.activities = userData![DatabaseField.activities]! as! [String]
//                        self.currentUser.lastDayGift = userData![DatabaseField.lastDayGift]! as! String
//
//                        let challengesFirebase = userData![DatabaseField.challenges]! as! [[String: Any]]
//
//                        for i in self.challenges.indices {
//
//                            let challengeFirebase = challengesFirebase[i]["\(self.challenges[i].challengeId)"]! as! [String: Any]
//
//                            let challengeData = [
//                                "\(self.challenges[i].challengeId)": [
//                                    DatabaseField.challengeId: challengeFirebase[DatabaseField.challengeId],
//                                    DatabaseField.challengeName: challengeFirebase[DatabaseField.challengeName],
//                                    DatabaseField.maxScore: challengeFirebase[DatabaseField.maxScore],
//                                    DatabaseField.lock: challengeFirebase[DatabaseField.lock],
//                                    DatabaseField.bonus2x: challengeFirebase[DatabaseField.bonus2x],
//                                ]
//                            ]
//
//                            self.currentUser.challengesCurrentUser.append(challengeData)
//                        }
//
//                        for i in self.challenges.indices {
//                            let currentChallengeData = self.currentUser.challengesCurrentUser[i]["\(self.challenges[i].challengeId)"] as? [String: Any]
//                            let challengeMaxScore = currentChallengeData![DatabaseField.maxScore]
//                            let challengesLock = currentChallengeData![DatabaseField.lock]
//                            let challengesBonus2x = currentChallengeData![DatabaseField.bonus2x]
//
//                            self.currentUser.challengesMaxScores["\(self.challenges[i].challengeId)"] = challengeMaxScore as? Int
//                            self.currentUser.challengesLock["\(self.challenges[i].challengeId)"] = challengesLock as? Bool
//                            self.currentUser.challengesBonus2x["\(self.challenges[i].challengeId)"] = challengesBonus2x as? Bool
//                        }
                    }
                }
            }
        }
    }
    
    fileprivate func generateUsername() {
        DispatchQueue.main.async {
            if UserDefaults.standard.bool(forKey: UserDataKey.getStarted) == false {
                FirestoreReferenceManager.referenceForRoot().getDocument { (document, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    
                    if let document = document {
                        let data = document.data()
                        self.uniqueUsernames = data![DatabaseFields.uniqueUsernames]! as! [String]
                        
                        self.username = "Player_\(Int.random(in: 10000..<999999))"
                        
                        while self.uniqueUsernames.contains(self.username){
                            self.username = "Player_\(Int.random(in: 10000..<999999))"
                        }
                        
                        self.uniqueUsernames.append(self.username)
                    }
                }
            }
        }
    }
}
