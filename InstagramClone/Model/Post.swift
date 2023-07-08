//
//  Post.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 8.7.23.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is the fist one test", likes: 102, imageUrl: "prof_pic03", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Thiss", likes: 124, imageUrl: "prof_pic02", timestamp: Date(), user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Testtttttt", likes: 102, imageUrl: "prof_pic04", timestamp: Date(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This is the fist one test", likes: 102, imageUrl: "prof_pic03", timestamp: Date(), user: User.MOCK_USERS[2]),
    ]
}
