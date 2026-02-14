//
//  SujiButton.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

struct SujiButton: View {
    
    let title: String
    let isEnabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            if isEnabled {
                action()
            }
        } label: {
            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(isEnabled ? .sujiRed : .sujiDisabledRed)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                )
        }
        .disabled(!isEnabled)
    }
}

