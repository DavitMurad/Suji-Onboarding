//
//  SujiLogout.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

struct SujiLogout: View {
    @Binding var path: [OnboardingRoute]
    @EnvironmentObject var userState: UserState
    var body: some View {
        Color.clear
            .frame(width: 0, height: 0)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    logoutButton
                }
            }
    }

    private var logoutButton: some View {
        Button {
            path = []
            userState.reset()
        } label: {
            Text("Log Out")
                .font(.headline)
                .padding()
                .frame(height: 50)
                .background(Capsule().fill(RadialGradient(colors: [.black.opacity(0.9), .white.opacity(0.15)], center: .center, startRadius: 30, endRadius: 60)))
                .overlay { Capsule().stroke(.gray, lineWidth: 0.5) }
        }
    }
}
