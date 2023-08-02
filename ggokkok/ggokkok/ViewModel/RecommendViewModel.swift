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
    @Published var injectionModel: InjectionModel = InjectionModel(site: 0, insulinType: .rapidActing, doses: 5)

    var exclusionSites: [Int] { UserInfo.shared.exclusionSites }
    static var lastSite: Int { UserInfo.shared.lastSiteNumber }

    init() {
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
        let notExclusionSite = injectionsBySiteArray.enumerated()
            .compactMap({ (site, injection) -> (site: Int, injection: Injection?)? in
                if site == 0 || exclusionSites.contains(site) {
                    return nil
                }
                return (site, injection)
            })

        if notExclusionSite.allSatisfy({ $0.injection != nil }) { // 모두 nil이 아닐 때
            let notExclusionInjections = notExclusionSite.compactMap { $0.injection }
            let injection = notExclusionInjections.sorted { $0.timestamp < $1.timestamp }.first!
            return (injection.wrappedSite, injection)
        } else { // 하나라도 nil이 있을 때,
            let sortedSites = notExclusionSite.sorted { $0.site < $1.site }
            for (site, injection) in sortedSites where injection == nil {
                return (site, nil)
            }
        }
        return (0, nil)
    }

    func insertInjection() {
        PersistenceController.shared.addInjection(
            doses: injectionModel.doses,
            insulinType: injectionModel.insulinType,
            site: injectionModel.site,
            time: Date()
        )
        injectionsBySiteArray = Self.buildInjectionsBySiteArray()
    }
}
