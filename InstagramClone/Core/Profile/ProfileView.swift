//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 4.7.23.
//

import SwiftUI

struct ProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                // header
                VStack(spacing: 10) {
                    // pic and stats
                    HStack {
                        Image("prof_pic01")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        HStack(spacing: 8) {
                            UserStatView(value: 4, title: "Posts")
                            UserStatView(value: 110, title: "Followers")
                            UserStatView(value: 143, title: "Following")
                        }
                    }
                    .padding(.horizontal)
                    //name and bio
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Bojan Angjeleski")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Do more !")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    //action button
                    Button(action: {}, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
                    })
                    Divider()
                }
                //post grid
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(0 ... 15, id: \.self){ index in
                        Image("prof_pic01")
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {}, label:{
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    })
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
