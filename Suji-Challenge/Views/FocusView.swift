//
//  FocusView.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

struct FocusView: View {
    @Binding var path: [OnboardingRoute]
    @State var selectedFocuses = [Focus]()
    @EnvironmentObject var userState: UserState
    var body: some View {
        ZStack {
            SujiGradient()
            ScrollView {
                focusContent
                    .padding(.top, 60)
            }
            if selectedFocuses.count > 0 {
                SujiButton(title: "Continue", isEnabled: true) {
                    userState.user.focusAreas = selectedFocuses
                    path.append(.upload)
                }
                .padding(.horizontal, 30)
            }
            
        }
        .toolbar {
            SujiLogout(path: $path)
        }
        
    }
}

//#Preview {
//    @Previewable @State var route: [OnboardingRoute] = [.focus]
//    FocusView(path: $route)
//}
