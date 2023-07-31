//
//  OnboardingView.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import SwiftUI

struct OnboardingView: View {

    var body: some View {
        Text("OnboardingView")
            .onTapGesture {
                UserDefaults.standard.set(16, forKey: "lastSiteNumber")
            }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
