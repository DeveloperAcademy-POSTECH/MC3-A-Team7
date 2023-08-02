//
//  OnboardingViewModel.swift
//  GgokKok
//
//  Created by chaekie on 2023/07/31.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    static let shared = OnboardingViewModel()

    static let udLastSiteNumber = UserDefaultsKey.lastSiteNumber.rawValue

    var lastSiteNumber: Int {
        get {
            return UserDefaults.standard.integer(forKey: OnboardingViewModel.udLastSiteNumber)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.udLastSiteNumber)
        }
    }
}
