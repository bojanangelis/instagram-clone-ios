//
//  CompleateSignUpView.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 6.7.23.
//

import SwiftUI

struct CompleateSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel

    var body: some View {
        
        VStack(spacing: 12) {
            VStack{
                Text("Welcome to Instagram, \(viewModel.username)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                    .multilineTextAlignment(.center)
                
                Text("Click below to complete registration and start using instagram")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.top)
            }
//            .padding(.vertical)

            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Complete Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

    struct CompleateSignUpView_Previews: PreviewProvider {
        static var previews: some View {
            CompleateSignUpView()
        }
    }
