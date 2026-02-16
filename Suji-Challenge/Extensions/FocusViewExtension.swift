//
//  FocusViewExtension.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 15.02.26.
//

import SwiftUI

extension FocusView {
    var focusContent: some View {
        
        VStack(spacing: 15) {
            
            Group {
                Text("My Focus")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                
                Text("Select where your body feels stiff, sore, or ready to grow stronger. You may select multiple options.")
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 60)
            
            VStack(spacing: 20) {
                ForEach(Focus.allCases, id: \.self) { focus in
                    FocusButton(
                        focus: focus,
                        isSelected: userState.user.focusAreas.contains(focus)
                    ) {
                        if userState.user.focusAreas.contains(focus) {
                            userState.user.focusAreas.remove(focus)
                        } else {
                            userState.user.focusAreas.insert(focus)
                        }
                    }
                }
            }
            .padding(.top, 50)
            .padding(.horizontal, 30)
            
        }
        .padding(.top, 80)
    }
}
