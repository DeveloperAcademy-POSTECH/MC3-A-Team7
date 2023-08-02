//
//  UserInfoManager.swift
//  GgokKok
//
//  Created by chaekie on 2023/08/02.
//

import Foundation

class UserInfo {
    static let shared = UserInfo()

    static let udExclusionSites = UserDefaultsKey.exclusionSites.rawValue
    static let udLastSiteNumber = UserDefaultsKey.lastSiteNumber.rawValue

    var exclusionSites: [Int] {
        get {
            UserDefaults.standard.array(forKey: Exclusion.udExclusionSites) as? [Int] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.udExclusionSites)
        }
    }
    var lastSiteNumber: Int {
        get {
            return UserDefaults.standard.integer(forKey: OnboardingViewModel.udLastSiteNumber)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.udLastSiteNumber)
        }
    }

    private init() { }
}
