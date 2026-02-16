//
//  FocusView.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

struct FocusView: View {
    @Binding var path: [OnboardingRoute]
    @EnvironmentObject var userState: UserState
    var body: some View {
        ZStack {
            SujiGradient()
            ScrollView {
                focusContent
            }
            if userState.user.focusAreas.count > 0 {
                
                SujiButton(title: "Continue", isEnabled: true) {
                    path.append(.upload)
                }
                .padding(.bottom, 15)
                .padding(.horizontal, 30)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .transition(.move(edge: .bottom).combined(with: .opacity))
                
            }
        }
        .toolbar {
            SujiLogout(path: $path)
        }
    }
}
