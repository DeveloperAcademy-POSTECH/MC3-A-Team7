//
//  RecommendationExclusionViewModel.swift
//  SikSa
//
//  Created by chaekie on 2023/07/29.
//

import SwiftUI

class RecommendationExclusionViewModel: ObservableObject {
    var sites: [Int]
    static let udExclusionSites = UserDefaultsKey.exclusionSites.rawValue
    var exclusionSites: [Int] {
        get {
            UserDefaults.standard.array(forKey: RecommendationExclusionViewModel.udExclusionSites) as? [Int] ?? []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.udExclusionSites)
        }
    }
//    @Published var exclusionSites = UserDefaults.standard.array(forKey: RecommendationExclusionViewModel.udExclusionSites) as? [Int] ?? []
    @Published var newExclusionSites: [Int] = []

    init(lastSiteNumber: Int) {
        sites = Array(1...lastSiteNumber)
        newExclusionSites = exclusionSites
    }

    func addSiteToExclusion(_ selectedSite: Int ) {
        newExclusionSites = (newExclusionSites + [selectedSite]).sorted()
        exclusionSites = newExclusionSites
    }
    func removeSiteFromExclusion(_ site: Int) {
        newExclusionSites = newExclusionSites.filter { $0 != site }
    }
    func saveUpdatedSites() {
        if exclusionSites != newExclusionSites {
//            UserDefaults.standard.set(newexclusionSites, forKey: Self.udExclusionSites)
            exclusionSites = newExclusionSites
        }
    }
}
