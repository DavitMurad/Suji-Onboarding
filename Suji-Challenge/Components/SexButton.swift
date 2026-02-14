//
//  SexButton.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

struct SexButton: View {
    let sex: Sex
    var isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(sex.rawValue)
                .frame(maxWidth: .infinity)
                .font(.headline)
                .bold()
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isSelected
                              ? Color.white.opacity(0.15)
                              : Color.black.opacity(0.5))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(isSelected ? 0.35 : 0.15), lineWidth: 1)
                )
                .shadow(
                    color: .black.opacity(0.4),
                    radius: isSelected ? 12 : 6,
                    y: 4
                )
        }
    }
}

