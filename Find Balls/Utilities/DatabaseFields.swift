//
//  DatabaseFields.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 09.12.2020.
//

import Foundation

struct DatabaseFields {
    
    static let id = "id"
    
    /// user data
    static let uid = "uid"
    static let userName = "userName"
    static let email = "email"
    static let date = "date"
    static let secretKey = "secretKey"
    static let daySequence = "daySequence"
    static let activities = "activities"
    static let cupsActivities = "cupsActivities"
    static let transactions = "transactions"
    static let totalGameCounter = "totalGameCounter"
    static let gameCheckpoints = "gameCheckpoints"
    static let lastDayGift = "lastDayGift"
    static let currencyBalls = "currencyBalls"
    static let currencyCups = "currencyCups"
    static let currencyMedic = "currencyMedic"
    
    static let challenges = "challenges"
    /// challenge data
    static let challengeId = "challengeId"
    static let challengeName = "challengeName"
    static let maxScore = "maxScore"
    static let lock = "lock"
    static let bonus2x = "bonus2x"
    static let gameCounter = "gameCounter"
    static let averageScore = "averageScore"
    static let scores = "scores"
    
    static let score = "score"
    
    static let nameActivity = "nameActivity"
    static let nameTransaction = "nameTransaction"

    static let cupsAmount = "cupsAmount"
    static let uniqueUsernames = "uniqueUsernames"
    
    static let username = "username"
}
