//
//  UploadView.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI
import PhotosUI

struct UploadView: View {
    @Binding var path: [OnboardingRoute]
    @EnvironmentObject var userState: UserState

    @State private var selectedItem: PhotosPickerItem?
    var body: some View {
        ZStack {
            SujiGradient()
            VStack() {
                Text("Upload profile image")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                if let image = userState.user.profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                     
                    
                    PhotosPicker(selection: $selectedItem) {
                        Text("Change Image")
                            .foregroundStyle(.black)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white))
                            
                    }
                    .onChange(of: selectedItem, { _, newValue in
                        Task {
                               if let data = try? await newValue?.loadTransferable(type: Data.self),
                                  let uiImage = UIImage(data: data) {
                                   userState.user.profileImage = uiImage
                               }
                           }
                    })
                    
                    Button ("Remove Image") {
                        userState.user.profileImage = nil
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white.opacity(0.2), lineWidth: 2)
                    )
                    
                    
                } else {
                    PhotosPicker(selection: $selectedItem) {
                        Circle()
                            .fill(.clear)
                            .stroke(Color.white.opacity(0.15), lineWidth: 2)
                        
                            .overlay {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 42))
                                    .foregroundStyle(.sujiRed)
                            }
                    }
                    .onChange(of: selectedItem, { _, newValue in
                        Task {
                               if let data = try? await newValue?.loadTransferable(type: Data.self),
                                  let uiImage = UIImage(data: data) {
                                   userState.user.profileImage = uiImage
                               }
                           }
                    })
                    .frame(width: 150, height: 150)
                }
                Spacer()
                
                Text("This will open your photo library.")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.bottom)
                
                if let _ = userState.user.profileImage {
                    SujiButton(title: "Continue", isEnabled: true) {
                        path.append(.end)
                    }
                }
                else {
                    Button {
                        path.append(.end)
                    } label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                            )
                    }
                }
            }
            .padding(.top, 50)
            .padding(.horizontal, 30)
        }
        .toolbar {
            SujiLogout(path: $path)
        }
    }
}

//#Preview {
//    @Previewable @State var route: [OnboardingRoute] = [.upload]
//    UploadView(path: $route)
//}
