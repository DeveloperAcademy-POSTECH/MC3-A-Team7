//
//  UserInfoManager.swift
//  GgokKok
//
//  Created by chaekie on 2023/08/02.
//

import Foundation

class UserInfo: ObservableObject {
    static let shared = UserInfo()

    static let udExclusionSites = UserDefaultsKey.exclusionSites.rawValue
    static let udLastSiteNumber = UserDefaultsKey.lastSiteNumber.rawValue

    var exclusionSites: [Int] {
        get {
            UserDefaults.standard.array(forKey: Self.udExclusionSites) as? [Int] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.udExclusionSites)
            objectWillChange.send()
        }
    }

    var lastSiteNumber: Int {
        get {
            return UserDefaults.standard.integer(forKey: Self.udLastSiteNumber)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.udLastSiteNumber)
        }
    }

    private init() { }
}
