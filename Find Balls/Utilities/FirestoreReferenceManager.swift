//
//  FirestoreReferenceManager.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 06.12.2020.
//

import Firebase
import FirebaseFirestore

struct FirestoreReferenceManager {
    static let environment = Test.run ? "dev" : "prod"

    static let db = Firestore.firestore()
    static let root = db.collection(environment).document(environment)

    static func referenceForRoot() -> DocumentReference {
        return root
    }
    
    static func referenceForUserData(uid: String) -> DocumentReference {
        return root.collection(FirebaseKeys.CollectionPath.users).document(uid)
    }
    
    static func referenceForUserStatistics(uid: String, challengeId: String) -> DocumentReference {
        return root
            .collection(FirebaseKeys.CollectionPath.users).document(uid)
            .collection(FirebaseKeys.CollectionPath.statistics).document(challengeId)
    }
    
    static func referenceForCupsActivities(uid: String) -> CollectionReference {
        return root
            .collection(FirebaseKeys.CollectionPath.users).document(uid)
            .collection(FirebaseKeys.CollectionPath.cupsActivities)
    }
    
    static func referenceForTransactions(uid: String) -> CollectionReference {
        return root
            .collection(FirebaseKeys.CollectionPath.users).document(uid)
            .collection(FirebaseKeys.CollectionPath.transactions)
    }
    
    static func referenceForRanks(challengeId: String) -> DocumentReference {
        return root
            .collection(FirebaseKeys.CollectionPath.ranks).document(challengeId)
    }
}


