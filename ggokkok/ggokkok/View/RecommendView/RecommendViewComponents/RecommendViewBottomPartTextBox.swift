//
//  MainViewTextBox.swift
//  MC3Prac
//
//  Created by 채영민 on 2023/07/28.
//

import SwiftUI

struct RecommendViewBottomPartTextBox: View {
    @ObservedObject var recommendModel: RecommendViewModel

    var body: some View {
        let siteNumberToString = String(recommendModel.recommendSiteNumber)
        HStack(alignment: .center, spacing: 5) {
            Spacer()
            Text("\(siteNumberToString)번 부위의 마지막 투여일은 \(Text("\(18)일 전").font(.system(size: 15, weight: .bold)))입니다.")
            Spacer()
        }
        .font(.subheadline)
        .padding()
        .background(Color.blue200)
        .cornerRadius(12)

    }

    func getDateCalculator(of injection: Injection) -> Int? {
        let offsetComps =
        Calendar.current.dateComponents([.day], from: injection.timestamp, to: Date())
        if case let (day?) = (offsetComps.day) {
            return day
        }
        return nil
    }
}
