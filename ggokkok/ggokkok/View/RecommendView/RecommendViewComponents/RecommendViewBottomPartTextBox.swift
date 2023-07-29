//
//  MainViewTextBox.swift
//  MC3Prac
//
//  Created by 채영민 on 2023/07/28.
//

import SwiftUI

struct RecommendViewBottomPartTextBox: View {

    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Spacer()
            Text("18번 부위의 마지막 투여일은 \(Text("8일 전").font(.system(size: 15, weight: .bold)))입니다.")
//            switch getDate {
//            case .some(let date): // 1일 이상 지난 것
//                let dateInfoText = date == 0 ?  "오늘" : "\(date)일 전"
//                Text("\(viewModel.positionNumberToKnow)번 부위의 마지막 투여일은")
//                Text("\(dateInfoText)").font(.system(size: 15, weight: .bold))
//                Text("입니다.")
//            case .none: // 기록 없는 것
//                Text("\(viewModel.positionNumberToKnow)번 부위의 투여기록이 없습니다.")
//            }
            Spacer()
        }
        .font(.subheadline)
        .padding()
        .background(Color.blue200)
        .cornerRadius(12)
    }
}
