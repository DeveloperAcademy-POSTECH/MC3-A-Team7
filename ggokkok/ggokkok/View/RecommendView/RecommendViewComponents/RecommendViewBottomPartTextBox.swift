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
        let diffDays = getDateCalculator(of: recommendModel.recommend.injection)
        let siteNumberToString = String(recommendModel.recommend.site)
        let filteredInjections = PersistenceController.shared.injections.filter { $0.site == recommendModel.recommend.site }
        HStack(alignment: .center, spacing: 5) {
            Spacer()
            switch diffDays {
            case .some(let date): // 1일 이상 지난 것
                let dateInfoText = date == 0 ? "오늘" : "\(date)일 전"
                Text("\(siteNumberToString)번 부위의 마지막 투여일은 \(Text("\(dateInfoText)").font(.system(size: 15, weight: .bold)))입니다.")
            case .none: // 기록 없는 것
                Text("\(siteNumberToString)번 부위의 투여기록이 없습니다.")
            }

            Spacer()
        }
        .font(.subheadline)
        .padding()
        .background(Color.blue200)
        .cornerRadius(12)

    }

    func getDateCalculator(of injection: Injection?) -> Int? {
        guard let injection else {
            return nil
        }
        let offsetComps =
        Calendar.current.dateComponents([.day], from: injection.timestamp, to: Date())
        if case let (day?) = (offsetComps.day) {
            return day
        }
        return nil
    }
}
