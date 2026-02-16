//
//  UploadView.swift
//  Suji-Challenge
//
//  Created by Davit Muradyan on 14.02.26.
//

import SwiftUI
import PhotosUI

struct UploadView: View {
    @Binding var path: [OnboardingRoute]
    @EnvironmentObject var userState: UserState
    
    @State var selectedItem: PhotosPickerItem?
    var body: some View {
        ZStack {
            SujiGradient()
            uploadViewContent
                .padding(.bottom, 20)
                .padding(.horizontal, 30)
        }
        .toolbar {
            SujiLogout(path: $path)
        }
    }
}

//#Preview {
//    @Previewable @State var route: [OnboardingRoute] = [.upload]
//    UploadView(path: $route)
//}
