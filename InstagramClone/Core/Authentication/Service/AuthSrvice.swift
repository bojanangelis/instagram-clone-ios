//
//  AuthSrvice.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 9.7.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()

    init() {
        Task { try await loadUserData() }
    }
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do{
            let loginResult = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = loginResult.user
            try await loadUserData()
        }
        catch {
            print("DEBUG: Failed to sign in with error\(error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserDAta(uid: result.user.uid, username: username, email: email)
        }
        catch {
            print("DEBUG: Failed to register useri with error \(error.localizedDescription)")
        }
    }
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.currentUser = try? snapshot.data(as: User.self)
    }
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserDAta(uid: String, username: String, email: String) async {
        let user = User(id: uid, email: email, username: username)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
