//
//  EmailView.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI


extension EmailView {
    var signUpCard: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 30)
                .fill(.ultraThinMaterial)
                .frame(height: 250)
                .frame(maxWidth: .infinity)
                .overlay(content: {
                    LinearGradient(
                        colors: [
                            Color.black.opacity(0.4),
                            Color.black.opacity(0.75)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                })
            
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.4), radius: 30)
                .padding()
            
            
                .overlay {
                    VStack(spacing: 25) {
                        Text("Sign Up")
                            .foregroundStyle(.white)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 20)
                        
                        
                        SujiTextField(placeholder: "Enter you email", textFieldText: $userState.user.emailAddress,  isFieldFocused: $isFieldFocused)

                        SujiButton(title: "Continue",isEnabled: isEmailValid) {
                            if isEmailValid {
                                isPresented = true
                                isFieldFocused = false
                            }
                        }
                        .disabled(!isEmailValid)
                        .navigationDestination(isPresented: $isPresented) {
                            DOBView()
                        }
                        
                    }
                    .padding(.horizontal, 30)
                }
        }
    }
}
