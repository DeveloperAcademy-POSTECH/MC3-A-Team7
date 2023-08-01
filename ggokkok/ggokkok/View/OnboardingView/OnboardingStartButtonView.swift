//
//  OnboardingStartButtonView.swift
//  GgokKok
//
//  Created by chaekie on 2023/07/31.
//

import SwiftUI

struct OnboardingStartButtonView: View {
    var viewModel: OnboardingViewModel
    var lastSite: String
    @FocusState var isFocused: Bool
    @Binding var isFirstLaunching: Bool

    var body: some View {
        Button {
            viewModel.setLastSiteNumber(Int(lastSite) ?? 31)
            isFocused = false
            if isFirstLaunching {
                isFirstLaunching = false
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 54)
                Text(isFirstLaunching ? "시작하기" : "저장하기")
                    .foregroundColor(.white)
            }
            .padding(.vertical)
        }
        .disabled(lastSite == "0")
    }
}

//struct OnboardingStartButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingStartButtonView(viewModel: OnboardingViewModel(),
//                                  lastSite: "",
//                                  isFocused: FocusState<Bool>().projectedValue,
//                                  isFirstLaunching: .constant(true))
//    }
//}
