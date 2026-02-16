//
//  SexViewExension.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI

extension SexView {
    var sexViewOptions: some View {
        VStack(alignment: .center, spacing: 20) {
            ForEach(Sex.allCases, id: \.self) { sex in
                
                SexButton(sex: sex, isSelected: userState.user.gender == sex) {
                    userState.user.gender = sex
                    path.append(.focus)
                }
            }
        }
    }
    
}
