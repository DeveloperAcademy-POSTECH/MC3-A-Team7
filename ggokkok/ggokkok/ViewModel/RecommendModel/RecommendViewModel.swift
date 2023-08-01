//
//  RecommendViewModel.swift
//  GgokKok
//
//  Created by 채영민 on 2023/07/29.
//

import Foundation

final class RecommendViewModel: ObservableObject {
    @Published var showSheet: Bool = false
    @Published var recommendSiteNumber: Int
    let lastSiteNumber = 32
    let injectionDataArray = PersistenceController.shared.injections
    var exclusionViewModel: RecommendationExclusionViewModel

    init() {
        exclusionViewModel = RecommendationExclusionViewModel(lastSiteNumber: lastSiteNumber)
        recommendSiteNumber = 0
        recommendSiteNumber = getRecommendSiteArray().min() ?? 0
    }

    func getRecommendSiteArray() -> [Int] {
        let exclusionSites = exclusionViewModel.exclusionSites
        let injectionDatas = injectionDataArray.compactMap { $0.site }
        exclusionViewModel.sites = exclusionViewModel.sites.filter { element in
            !exclusionSites.contains(element) && !injectionDatas.contains(Int16(element))
        }

        return exclusionViewModel.sites
    }

    func getRecommendSiteNumber() -> Int {
        guard let recommendSiteNumber = getRecommendSiteArray().min() else {
            return 0
        }
        return recommendSiteNumber
    }

}
