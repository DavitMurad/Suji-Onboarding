//
//  SexView.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

struct SexView: View {
    @EnvironmentObject var userState: UserState
    @Binding var path: [OnboardingRoute]

    var body: some View {
        ZStack {
            SujiGradient()
        
        VStack(spacing: 50) {
            
            Text("What is you sex?")
                .foregroundStyle(.white)
                .font(.title)
                .bold()
                .padding(.bottom, 20)
            
            sexViewOptions
            Spacer()
        }
        .padding(.top, 60)
        .padding(.horizontal, 30)
    }
        .toolbar {
            SujiLogout(path: $path)
        }
    }
}
