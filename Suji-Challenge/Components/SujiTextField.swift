//
//  TextFieldComponent.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//


import SwiftUI

struct SujiTextField: View {
    let placeholder: String
    @Binding var textFieldText: String
    @FocusState.Binding var isFieldFocused: Bool
    var body: some View {
        TextField(placeholder, text: $textFieldText)
            .padding()
            .frame(height: 60)
            .background(RoundedRectangle(cornerRadius: 18).fill(.ultraThinMaterial))
            .foregroundColor(.white)
            .focused($isFieldFocused)
            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
