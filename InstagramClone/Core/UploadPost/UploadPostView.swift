//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Bojan Angjeleski on 9.7.23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModal = UploadPostViewModal()
    @Binding var tabIndex: Int
    var body: some View {
        VStack {
            //action tool bar
            HStack {
                Button {
                    caption = ""
                    viewModal.selectedImage = nil
                    viewModal.postImage = nil
                    tabIndex = 0
                } label: {
                    Text("cancel")
                }
                Spacer()
                
                Text("New post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    print("uplaod")
                } label: {
                    Text("uplaod")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // post image and caption
            HStack(spacing: 14) {
                if let image = viewModal.postImage{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModal.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
