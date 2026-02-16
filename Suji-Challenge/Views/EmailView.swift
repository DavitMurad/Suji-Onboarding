//
//  ContentView.swift
//  Suji-Challenge
//
//  Created by Findlay Wood on 09/02/2026.
//

import SwiftUI

struct EmailView: View {
    @EnvironmentObject var userState: UserState
    @FocusState var isFieldFocused: Bool
    @Binding var path: [OnboardingRoute]
    @State var isPresented = false
    
    var isEmailValid: Bool {
        userState.user.emailAddress.isValidEmail()
    }
    var body: some View {
        GeometryReader { geom in
            ZStack {
                Image("onboarding_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ScrollView {
                    signUpCard
                        .frame(minHeight: geom.size.height) // Letting view know of its exact size to be able to scroll up upon activating keyboard
                }
                .scrollDismissesKeyboard(.interactively)
            }
            .onTapGesture { if isFieldFocused { isFieldFocused = false }}
        }
    }
    
}
