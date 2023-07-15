//
//  UserService.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 15.7.23.
//

import Foundation
import Firebase


struct UserService {
    
    func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            print("DEBUG: \(doc.data())")
        }
    }
}
