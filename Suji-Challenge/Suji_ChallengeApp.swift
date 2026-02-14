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
    @State private var path: [OnboardingRoute] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                EmailView(path: $path)
                    .navigationDestination(for: OnboardingRoute.self, destination: { route in
                        switch route {
                        case .dob:
                            DOBView(path: $path)
                                .environmentObject(userState)
                        case .sex:
                            SexView(path: $path)
                                .environmentObject(userState)
                        case .focus:
                            FocusView(path: $path)
                        case .upload:
                            UploadView(path: $path)
                        }
                    })
                    .environmentObject(userState)
            }
            .preferredColorScheme(.dark)
        }
        
    }
}
