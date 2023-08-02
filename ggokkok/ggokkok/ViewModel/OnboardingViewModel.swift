//
//  OnboardingViewModel.swift
//  GgokKok
//
//  Created by chaekie on 2023/07/31.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    static let udLastSiteNumber = UserDefaultsKey.lastSiteNumber.rawValue
    static let shared = OnboardingViewModel()

    var lastSiteNumber: Int {
        get {
            print("hehe", UserDefaults.standard.integer(forKey: OnboardingViewModel.udLastSiteNumber))
            return UserDefaults.standard.integer(forKey: OnboardingViewModel.udLastSiteNumber)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.udLastSiteNumber)
        }
    }
}
