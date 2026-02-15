//
//  EndView.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 15.02.26.
//

import SwiftUI

struct EndView: View {
    @Binding var path: [OnboardingRoute]
    @EnvironmentObject var userState: UserState

    var body: some View {
        ZStack {
            SujiGradient()

            VStack(spacing: 25) {
                
                Text("You're All Set")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)

                Text("Thank you for completing the onboarding.")

                Divider()
                    .background(.white.opacity(0.2))
                    .padding(.vertical)

                VStack(alignment: .leading, spacing: 12) {
                    Text("Email: \(userState.user.emailAddress)")
                    Text("Date of Birth: \(userState.user.dob ?? "N/A")")
                    Text("Gender: \(userState.user.gender?.rawValue ?? "N/A")")
                    Text("Focus: \(formattedFocus)")
                }
                .foregroundStyle(.white.opacity(0.8))
                .multilineTextAlignment(.leading)

                if let image = userState.user.profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .padding(.top)
                }

                Spacer()

                SujiButton(title: "Finish", isEnabled: true) {
                    userState.reset()
                    path = []
                }
            }
            .padding(30)
        }
        .toolbar {
            SujiLogout(path: $path)
        }
    }
    private var formattedFocus: String {
         userState.user.focusAreas
             .map { $0.rawValue }
             .joined(separator: ", ")
     }
}


