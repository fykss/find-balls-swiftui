//
//  User.swift
//  Find Balls
//
//  Created by Vladyslav Lietun on 07.12.2020.
//

import Foundation

struct User: Encodable {
    var uid: String
    var username: String
    var email: String
    var date: Date
}
