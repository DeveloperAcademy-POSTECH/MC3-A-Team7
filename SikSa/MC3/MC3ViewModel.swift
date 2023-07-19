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
    @Published var arr0: [Int] = []
    @Published var arr1: [Int] = []
    @Published var recomNum: Int = 1
    @Published var pickedNum: Int = 0
    @Published var randomArr: [Int] = []
    @Published var randomInt = 0
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var isNoTabSelected: Bool {
        return isTabbed0.filter({ $0 == true }).count == 0 && isTabbed1.filter({ $0 == true }).count == 0
    }
    func arrFunc1() -> Int {
        var arr2: [Int] = [1, 2, 3, 4]
        var arr3: [Int] = []

        for _ in 0...2 {
            for iNumber in arr2.sorted(by: >)[0...3] {
                arr2.append(iNumber + 8)
            }
        }

        for jNumber in arr2.sorted() {
            arr3.append(jNumber + 4)
        }

        arr0 = arr2.sorted(by: <)
        arr1 = arr3

        return max(arr0.count, arr1.count)
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
        let maxIndex = arrFunc1()
        isTabbed0 = Array(repeating: false, count: maxIndex)
        isTabbed1 = Array(repeating: false, count: maxIndex)
    }

    func recommendationNum() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
        Text(isNoTabSelected || !isClicked ? "이번 권장 주사 부위는" : "선택하신 주사 부위는").font(.system(size: 22, weight: .semibold))
            HStack(alignment: .bottom) {
            Text(isNoTabSelected ? "\(recomNum)" : "\(pickedNum)")
                    .font(.system(size: 28, weight: .semibold)).foregroundColor(.blue)
                Text("번 입니다.").font(.system(size: 22, weight: .semibold))
            }
        }
        .padding(.leading, 21)
    }

    func randomeIntArrFunc() {
        for _ in 1...5 {
            randomInt = Int.random(in: 2..<33)
            if !randomArr.contains(randomInt) {
                randomArr.append(randomInt)
            }
        }
    }
}
