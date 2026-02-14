//
//  SujiGradient.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//
import SwiftUI

struct SujiGradient: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white.opacity(0.1), .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}
