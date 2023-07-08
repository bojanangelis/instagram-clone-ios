//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 4.7.23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            FeedView()
                .tabItem {
                Image(systemName: "house")
            }
            SearchView()
                .tabItem {
                Image(systemName: "magnifyingglass")
            }
            Text("Upload post")
                .tabItem {
                Image(systemName: "plus.square")
            }
            Text("Notifications")
                .tabItem {
                Image(systemName: "heart")
            }
            CurrentUserProfileView(user: User.MOCK_USERS[0])
                .tabItem {
                Image(systemName: "person")
            }
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
