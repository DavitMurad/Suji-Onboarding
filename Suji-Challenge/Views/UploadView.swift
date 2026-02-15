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
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    var body: some View {
        ZStack {
            SujiGradient()
            VStack() {
                Text("Upload profile image")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                
                Spacer()
                
                if let selectedImage = selectedImage {
                    selectedImage
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                    
                    PhotosPicker(selection: $selectedItem) {
                        Text("Change Image")
                    }
                    Button ("Remove Image") {
                        self.selectedImage = nil
                    }
                    
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
                            if let image = try? await newValue?.loadTransferable(type: Image.self) {
                                selectedImage = image
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
                
                if let _ = selectedImage {
                    SujiButton(title: "Continue", isEnabled: true) {
                        path.append(.end)
                    }
                }
                else {
                    Button {
                        
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

#Preview {
    @Previewable @State var route: [OnboardingRoute] = [.upload]
    UploadView(path: $route)
}
