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
            
            VStack(alignment: .center, spacing: 20) {
                ForEach(Sex.allCases, id: \.self) { sex in
                    
                    SexButton(sex: sex, isSelected: userState.user.gender == sex) {
                        userState.user.gender = sex
                        
                        Task {
                            try? await Task.sleep(nanoseconds: 100000000)
                            path.append(.focus)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(.top, 50)
        .padding(.horizontal, 30)
    }
        .toolbar {
            SujiLogout(path: $path)
        }
    }
}
