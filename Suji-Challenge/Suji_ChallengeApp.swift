//
//  Suji_ChallengeApp.swift
//  Suji-Challenge
//
//  Created by Findlay Wood on 09/02/2026.
//

import SwiftUI

@main
struct Suji_ChallengeApp: App {
    @State private var userState = UserState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EmailView()
                    .environmentObject(userState)
            }
        }
    }
}
