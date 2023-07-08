//
//  FeedCelView.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 4.7.23.
//

import SwiftUI

struct FeedCelView: View {
    let post: Post
    var body: some View {
        VStack {
            HStack{
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }.padding(.leading, 8)

            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            HStack(spacing: 16) {
                Button{
                    print("Like post")
                }label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button{
                    print("Comment post")
                }label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button{
                    print("Share post")
                }label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                        
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
          
            Text("\(post.likes) likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.top, 1.2)
            
            HStack{
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 0.2)
            .font(.footnote)
            
            Text("6h ago")
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 0.2)
        }
    }
}

struct FeedCelView_Previews: PreviewProvider {
    static var previews: some View {
        FeedCelView(post: Post.MOCK_POSTS[0])
    }
}
