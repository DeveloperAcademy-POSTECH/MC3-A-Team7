//
//  RecommendationExclusionViewModel.swift
//  SikSa
//
//  Created by chaekie on 2023/07/29.
//

import SwiftUI

class RecommendationExclusionViewModel: ObservableObject {
    var sites: [Int]
    let userInfo = UserInfo.shared
    var exclusionSites: [Int]
    @Published var newExclusionSites: [Int] = []

    init(lastSiteNumber: Int) {
        sites = Array(1...lastSiteNumber)
        exclusionSites = userInfo.exclusionSites
        newExclusionSites = userInfo.exclusionSites
    }

    func addSiteToExclusion(_ selectedSite: Int ) {
        newExclusionSites = (newExclusionSites + [selectedSite]).sorted()
        userInfo.exclusionSites = newExclusionSites
        exclusionSites = newExclusionSites
    }
    func removeSiteFromExclusion(_ site: Int) {
        newExclusionSites = newExclusionSites.filter { $0 != site }
    }
    func saveUpdatedSites() {
        if userInfo.exclusionSites != newExclusionSites {
            exclusionSites = newExclusionSites
            userInfo.exclusionSites = newExclusionSites
        }
    }
}
