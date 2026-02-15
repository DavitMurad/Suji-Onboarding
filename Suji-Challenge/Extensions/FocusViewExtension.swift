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
                    FocusButton(focus: focus, isSelected: selectedFocuses.contains(focus)) {
                        selectedFocuses.append(focus)
                    }
                }
            }
            .padding(.horizontal, 30)
          
            .padding(.top, 50)
        }
    }
}
