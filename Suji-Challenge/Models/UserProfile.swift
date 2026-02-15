//
//  UserProfile.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 13.02.26.
//

import Foundation
import SwiftUI

struct UserProfile {
    var emailAddress = ""
    var dob: String?
    var gender: Sex?
    var focusAreas: Set<Focus> = []
    var profileImage: UIImage?
    
}
