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
    @Published var under7DaysArrPositions: [Int16] = []
    @Published var under7DaysArrTimestamps: [Date] = []
    @Published var listOfDateArr: [Date] = []

    init() {
        setRecommendedPosition()
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
        let injectionsArray = PersistenceController.shared.injectionsByPositionArray

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

    func getDateCalculator(of position: Int, using injections: [Injection?]) -> Int {
        if let injection = injections[position] {
            let offsetComps =
            Calendar.current.dateComponents([.year, .month, .day], from: injection.timestamp ?? Date(), to: Date())
            if case let (day?) = (offsetComps.day) {
                return day
            }
       }
        return 0
    }

    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.M.dd"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: date)
    }
}
