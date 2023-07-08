//
//  User.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 8.7.23.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    let email: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, email: "bojanangjeleski@gmail.com", username: "bojanangjeleski", profileImageUrl: "prof_pic01", fullname: "Bojan Angjeleski", bio: "Do more !"),
        .init(id: NSUUID().uuidString, email: "bojanangelis@gmail.com", username: "bojanangelis", profileImageUrl: "prof_pic03", fullname: nil, bio: "Second chanel"),
        .init(id: NSUUID().uuidString, email: "bojanangjeleskionfilm@gmail.com", username: "bojanonfilm", profileImageUrl: "prof_pic04", fullname: "Bojan Angjeleski", bio: "Pictures on film"),
        .init(id: NSUUID().uuidString, email: "bojanangjeleski@gmail.com", username: "bojanangjeleski", profileImageUrl: "prof_pic02", fullname: "Bojan Angjeleski", bio: "Do more !"),
    ]
}
