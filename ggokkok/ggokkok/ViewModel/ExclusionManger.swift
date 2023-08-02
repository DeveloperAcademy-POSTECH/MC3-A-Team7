//
//  ExclusionManger.swift
//  GgokKok
//
//  Created by chaekie on 2023/08/02.
//

import Foundation

class Exclusion: ObservableObject {
    static let udExclusionSites = UserDefaultsKey.exclusionSites.rawValue
    var exclusionSites: [Int] {
        get {
            UserDefaults.standard.array(forKey: Exclusion.udExclusionSites) as? [Int] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.udExclusionSites)
        }
    }
}
