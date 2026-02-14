//
//  UserState.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 13.02.26.
//

import SwiftUI
import Combine

final class UserState: ObservableObject {

    @Published var user = UserProfile()

    func reset() {
        user = UserProfile()
    }
}
