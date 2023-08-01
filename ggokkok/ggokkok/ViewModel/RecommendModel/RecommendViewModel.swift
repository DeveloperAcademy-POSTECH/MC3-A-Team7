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
    @Published var exclusionArray: [Int] = []

    var exclusionViewModel: RecommendationExclusionViewModel
    var onboardingViewModel = OnboardingViewModel()

    enum Status {
        case noneRecord
        case under7days
        case over7days
    }

    init() {
        exclusionViewModel = RecommendationExclusionViewModel(lastSiteNumber: onboardingViewModel.lastSiteNumber)
        recommendSiteNumber = 0
        recommendSiteNumber = getRecommendSiteArray().min() ?? 0
    }

    func getRecommendSiteArray() -> [Int] {
        let exclusionSites = exclusionViewModel.exclusionSites
        let injectionDatas = PersistenceController.shared.injections.compactMap { $0.site }
        exclusionArray = exclusionViewModel.sites.filter { element in
            !exclusionSites.contains(element) && !injectionDatas.contains(Int16(element))
        }
        return exclusionArray
    }

    func getCircleStatus(of injection: Injection?) -> Status {
        let oneWeekAgo = Date() - 7
        switch (injection) {
        case (.some(let injection)) where injection.timestamp == nil:
                return .noneRecord
        case (.some(let injection)) where injection.timestamp >= oneWeekAgo:
            return .under7days
        default:
            return .over7days
        }
    }
}
