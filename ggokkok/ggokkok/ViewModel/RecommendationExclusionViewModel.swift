//
//  RecommendationExclusionViewModel.swift
//  SikSa
//
//  Created by chaekie on 2023/07/29.
//

import SwiftUI

class RecommendationExclusionViewModel: ObservableObject {
    var sites: [Int]
    var exclusion: Exclusion
    var exclusionSites: [Int]
    @Published var newExclusionSites: [Int] = []

    init(lastSiteNumber: Int) {
        sites = Array(1...lastSiteNumber)
        exclusion = Exclusion()
        exclusionSites = exclusion.exclusionSites
        newExclusionSites = exclusion.exclusionSites
    }

    func addSiteToExclusion(_ selectedSite: Int ) {
        newExclusionSites = (newExclusionSites + [selectedSite]).sorted()
        exclusionSites = newExclusionSites
        exclusion.exclusionSites = newExclusionSites
    }
    func removeSiteFromExclusion(_ site: Int) {
        newExclusionSites = newExclusionSites.filter { $0 != site }
    }
    func saveUpdatedSites() {
        if exclusion.exclusionSites != newExclusionSites {
            exclusionSites = newExclusionSites
            exclusion.exclusionSites = newExclusionSites
        }
    }
}
