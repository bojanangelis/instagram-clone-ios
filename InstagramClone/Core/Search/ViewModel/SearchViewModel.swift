//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 15.7.23.
//

import Foundation


class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    func fetchAllUsers() {
        
    }
}
