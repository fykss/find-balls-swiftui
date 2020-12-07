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
}


