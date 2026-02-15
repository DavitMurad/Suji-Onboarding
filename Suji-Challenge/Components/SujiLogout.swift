//
//  SujiLogout.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

struct SujiLogout: ToolbarContent {
    @Binding var path: [OnboardingRoute]
    @EnvironmentObject var userState: UserState
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button("Log Out") {
                path = []
                userState.reset()
            }
        }
    }
}
