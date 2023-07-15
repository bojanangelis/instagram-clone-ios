//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 10.7.23.
//

import Foundation


class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser () async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        username = ""
        email = ""
        password = ""
    }
}
