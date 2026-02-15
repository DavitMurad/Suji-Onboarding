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
        
        dateStackContent
                .padding(.horizontal)
                .padding(.top, 60)
        
            .toolbar {
                SujiLogout(path: $path)
            }
                    .navigationBarBackButtonHidden()
    }
}
}

//#Preview {
//    DOBView()
//}
