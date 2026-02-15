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
                    .padding(.top, 60)
            }
            if userState.user.focusAreas.count > 0 {
                withAnimation(.easeInOut) {
                    SujiButton(title: "Continue", isEnabled: true) {
                        path.append(.upload)
                    }
                    .padding(.horizontal, 30)
                }
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
