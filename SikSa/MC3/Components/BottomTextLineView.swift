//
//  BottomTextLineView.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/18.
//

import SwiftUI

struct BottomTextLineView: View {
    @ObservedObject var viewModel: MC3ViewModel
    let injections = PersistenceController.shared.injectionsByPositionArray

    var body: some View {
        let getDate =
        viewModel.getDateCalculator(of: viewModel.positionNumberToKnow, using: injections)
        HStack(alignment: .center, spacing: 5) {
            switch getDate {
            case .some(let date): // 1일 이상 지난 것
                let dateInfoText = date == 0 ?  "오늘" : "\(date)일 전"
                Text("\(viewModel.positionNumberToKnow)번 부위의 마지막 투여일은")
                Text("\(dateInfoText)").font(.system(size: 15, weight: .bold))
                Text("입니다.")
            case .none: // 기록 없는 것
                Text("\(viewModel.positionNumberToKnow)번 부위의 투여기록이 없습니다.")
            }
        }
        .font(.subheadline)
        .foregroundColor(.black)
        .padding()
        .background(
            Rectangle()
            .foregroundColor(.boxBackgroundColor)
            .cornerRadius(12)
            .frame(width: 350, height: 48)
        )
    }
}
