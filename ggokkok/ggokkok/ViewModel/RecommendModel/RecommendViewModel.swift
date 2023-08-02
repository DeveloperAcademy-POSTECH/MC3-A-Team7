//
//  RecommendViewModel.swift
//  GgokKok
//
//  Created by 채영민 on 2023/07/29.
//

import Foundation

final class RecommendViewModel: ObservableObject {
    @Published var showSheet: Bool = false
    @Published var exclusionArray: [Int] = []
    @Published var injectionsBySiteArray: [Injection?] = []

    var exclusionViewModel: RecommendationExclusionViewModel
    static var lastSite: Int { OnboardingViewModel.shared.lastSiteNumber }

    enum Status {
        case noneRecord
        case under7days
        case over7days
    }

    init() {
        exclusionViewModel = RecommendationExclusionViewModel(lastSiteNumber: RecommendViewModel.lastSite)
        injectionsBySiteArray = Self.buildInjectionsBySiteArray()
    }

    static func buildInjectionsBySiteArray() -> [Injection?] {
        var resultArray: [Injection?] = Array(repeating: nil, count: lastSite + 1)
        PersistenceController.shared.injections.forEach { injection in
            if resultArray[injection.wrappedSite] != nil,
               let previousInjection = resultArray[injection.wrappedSite],
               previousInjection.timestamp > injection.timestamp {
                return
            }
            resultArray[injection.wrappedSite] = injection
        }
        return resultArray
    }

    var recommend: (site: Int, injection: Injection?) {
        let exclusionSites = exclusionViewModel.exclusionSites
        let notExclusionSites = (injectionsBySiteArray.filter { injection in
            if let injection {
                return !exclusionSites.contains(injection.wrappedSite)
            }
            return false
        })

        // nil이 있다면, index가 가장 낮은 친구를 반환한다.
        if injectionsBySiteArray[1...].contains(nil) {
            for (index, injection) in injectionsBySiteArray.enumerated() where index != 0 && injection == nil {
                return (index, nil)
            }
        } else {
            // nil이 아닐 시,injectionsArray중 가장 오래된 포지션을 리턴
            let injection = (injectionsBySiteArray.compactMap { $0 }
                .sorted { $0.timestamp < $1.timestamp }
                .first!)
            return (injection.wrappedSite, injection)
        }
        return (0, nil)
    }

//    func getCircleStatus(of injection: Injection?) -> Status {
//        let oneWeekAgo = Date() - 7
//        switch (injection) {
//        case (.some(let injection)) where injection.timestamp == nil:
//                return .noneRecord
//        case (.some(let injection)) where injection.timestamp >= oneWeekAgo:
//            return .under7days
//        default:
//            return .over7days
//        }
//    }

    func insertInjection(_ injection: RecommendViewSheetView.InjectionModel) {
        PersistenceController.shared.addInjection(
            doses: injection.doses, insulinType: injection.insulinType, site: injection.site, time: Date())
        injectionsBySiteArray = Self.buildInjectionsBySiteArray()
    }
}
