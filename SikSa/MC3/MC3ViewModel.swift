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
    @Published var isTabbed0: [Bool] = []
    @Published var isTabbed1: [Bool] = []
    @Published var isClicked: Bool = false
    @Published var recomNum: Int = 1
    @Published var pickedNum: Int?
    @Published var under7DaysArr: [Int] = []
    @Published var listOfDateArr: [Date] = []

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

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var isNoTabSelected: Bool {
        return isTabbed0.filter({ $0 == true }).count == 0 && isTabbed1.filter({ $0 == true }).count == 0
    }

    var positionNumberToKnow: Int {
        pickedNum ?? recomNum
    }

    func nextNumRecom() {
        if recomNum == 32 {
            recomNum = 1
            return
        }
        if recomNum + 8 > 32 {
            recomNum = (recomNum + 8) - 31
        } else {
            recomNum += 8
        }
    }

    func tabViewIndicatorDot() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemBlue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }

    func resetAllTabbedStates() {
        let arrayLength = leftArray.count
        isTabbed0 = Array(repeating: false, count: arrayLength)
        isTabbed1 = Array(repeating: false, count: arrayLength)
    }

    func under7DaysArrFunc() -> [Int] {
        let injectionsArray = PersistenceController.shared.injectionsByPositionArray
        for item2 in injectionsArray {
            if let injection = item2 {
                under7DaysArr.append(Int(injection.position))
            }
        }

        NotificationCenter.default.post(name: NSNotification.Name("RefreshInjectionPoint"), object: nil)
        return under7DaysArr

    }

    func listOfDate() -> [Date] {
        let injectionsArray = PersistenceController.shared.injectionsByPositionArray
        for date in injectionsArray {
            if let injectionDate = date {
                listOfDateArr.append(injectionDate.timestamp ?? Date())
            }
        }

        return listOfDateArr
    }

}
