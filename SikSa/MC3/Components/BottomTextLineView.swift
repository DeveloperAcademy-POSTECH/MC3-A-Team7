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
            if getDate != 0 {
                Text("\(viewModel.positionNumberToKnow)번 부위의 마지막 투여일은")
                Text("\(getDate)일 전").font(.system(size: 15, weight: .bold))
                Text("입니다.")
            } else {
                Text("\(viewModel.positionNumberToKnow)번 부위의 투여기록이 없습니다.")
            }
        }
        .font(.system(size: 15))
        .foregroundColor(.black)
        .padding()
        .background(
            Rectangle()
                .foregroundColor(Color(hex: "5987FE")).opacity(0.19)
                .frame(minWidth: 350)
                .cornerRadius(12)
        )
    }
}
