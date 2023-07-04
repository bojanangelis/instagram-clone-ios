//
//  UserStatView.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 4.7.23.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text("\(title)")
                .font(.footnote)
        }
        .frame(width: 72)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 12, title: "Post")
    }
}
