//
//  MC3ViewModel.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/18.
//

import Foundation
import SwiftUI

class MC3ViewModel: ObservableObject {

    static var preview = MC3ViewModel()
    @Published var page = 0
    @Published var recommendedPosition: Int = 0
    @Published var pickedPosition: Int?
    @Published var isToastOnApear: Bool = false
    @Published var isUnder7DaysTabbed: Bool = false
    @Published var under7DaysButtonActivate: Bool = false
    @Published var under7DaysArrPositions: [Int16] = []
    @Published var under7DaysArrTimestamps: [Date] = []
    @Published var listOfDateArr: [Date] = []
    @Published var showUpdateModal: Bool = false
    @Published var injectionsByPositionArray: [Injection?]

    var lastUpdatedInjection: Injection? {
        PersistenceController.shared.lastUpdatedInjection
    }

    init() {
        injectionsByPositionArray = Self.buildInjectionsByPositionArray()
        setRecommendedPosition()
    }

    var selectedInjectionInMainView: Injection? {
        guard let pickedPosition,
              let injection = injectionsByPositionArray[pickedPosition] else {
            return nil
        }
        return injection
    }

    static func buildInjectionsByPositionArray() -> [Injection?] {
        var resultArray: [Injection?] = Array(repeating: nil, count: 33)
        PersistenceController.shared.injections.forEach { injection in
            if resultArray[safe: injection.wrappedPosition] != nil,
               let previousInjection = resultArray[safe: injection.wrappedPosition],
               let prev = previousInjection,
               prev.wrappedTimestamp > injection.wrappedTimestamp {
                return
            }
            resultArray[injection.wrappedPosition] = injection
        }
        return resultArray
    }

    var isPositionSelected: Bool {
        pickedPosition != nil
    }

    var positionNumberToKnow: Int {
        if pickedPosition == nil {
            return recommendedPosition
        } else {
            return pickedPosition ?? 1
        }
    }

    var leftArray: [Int] {
        [1, 9, 17, 25].flatMap { number in
            (0...3).map({ $0 + number })
        }
    }

    var rightArray: [Int] {
        [1, 9, 17, 25]
            .map({$0 + 4})
            .flatMap { number in
                (0...3).map({ $0 + number })
            }
    }

    func setRecommendedPosition() {
        print(#function)
        let injectionsArray = injectionsByPositionArray

        if injectionsArray.contains(nil) {
            for (index, injection) in injectionsArray.enumerated() where index != 0 && injection == nil {
                recommendedPosition = index
                return
            }
        } else {
            // nil이 아닐 시,injectionsArray중 가장 오래된 포지션을 리턴
            recommendedPosition = Int(injectionsArray.compactMap { $0 }
                .sorted { $0.wrappedTimestamp > $1.wrappedTimestamp }
                .first?.position ?? 1)
        }
    }

    func insertInjection(position: Int) {
        PersistenceController.shared
            .addInjection(
                time: Date(),
                position: position
            )
        injectionsByPositionArray = Self.buildInjectionsByPositionArray()
    }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    func tabViewIndicatorDot() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemBlue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }

    func getCircleStatus(of position: Int, using injections: [Injection?]) -> TabViewCircleView.Status {
        print(injections)
        if let injection = injections[position] {
            let oneWeekAgo = Date() - 7
            if injection.wrappedTimestamp < oneWeekAgo {
                return .over7days
            }
            return .under7days
        } else if position == recommendedPosition {
            return .recommendation
        }
        return .over7days
    }

    func getDateCalculator(of injection: Injection?) -> Int? {
        if let injection {
            let offsetComps =
            Calendar.current.dateComponents([.day], from: injection.timestamp ?? Date(), to: Date())
            if case let (day?) = (offsetComps.day) {
                return day
            }
       }
        return nil
    }

    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.dd"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
    }

    func buttonActionForRecord() {
        if let pickedPosition {
            PersistenceController.shared
                .addInjection(
                    time: Date(),
                    position: pickedPosition
                )
        }
        isToastOnApear.toggle()
        injectionsByPositionArray = Self.buildInjectionsByPositionArray()
        pickedPosition = nil
        setRecommendedPosition()
    }
}
