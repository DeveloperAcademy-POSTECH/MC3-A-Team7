//
//  OnboardingViewModel.swift
//  GgokKok
//
//  Created by chaekie on 2023/07/31.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    static let udLastSiteNumber = UserDefaultsKey.lastSiteNumber.rawValue
    @Published var lastSiteNumber: Int

    init() {
        lastSiteNumber = UserDefaults.standard.integer(forKey: OnboardingViewModel.udLastSiteNumber)
    }

    func setLastSiteNumber(_ number: Int) {
        UserDefaults.standard.set(number, forKey: Self.udLastSiteNumber)
    }
}
