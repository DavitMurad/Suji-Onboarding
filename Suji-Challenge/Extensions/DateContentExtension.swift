//
//  DateStackExtension.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

extension DOBView {
    var dateStackContent: some View {
        VStack(spacing: 40) {
            Text("What is your birth date?")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
            
            DatePicker(
                "",
                selection: $selectedBirthDate,
                in: Date().birthDateRange,
                displayedComponents: .date
            )
            .datePickerStyle(.graphical)
            .background(Color(white: 0.2))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .tint(.blue)
            .onChange(of: selectedBirthDate) { _, _ in
                hasUserSelectedDate = true
            }
            
            Spacer()
            
            
            if hasUserSelectedDate {
                Text(selectedBirthDate.formatted(date: .numeric, time: .omitted))
                    .foregroundStyle(.gray)
                    .bold()
                    .padding(.top, 30)
                
                Spacer()
                
                
                SujiButton(title: "Continue", isEnabled: true) {
                    userState.user.dob = selectedBirthDate.formatted(date: .numeric, time: .omitted)
                    path.append(.focus)
                }
            }
        }

        .padding(.horizontal)
        .padding(.top)
    }
    
}
