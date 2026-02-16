//
//  DOBView.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

struct DOBView: View {
    @State var selectedBirthDate: Date = Date()
    @State var hasUserSelectedDate = false
    @EnvironmentObject var userState: UserState
    @Binding var path: [OnboardingRoute]
    
    var body: some View {
        ZStack {
            SujiGradient()
            ScrollView {
                dateStackContent
                    .padding(.horizontal)
                    .toolbar {
                        SujiLogout(path: $path)
                    }
            }
            .navigationBarBackButtonHidden()
        }
        
    }
}

