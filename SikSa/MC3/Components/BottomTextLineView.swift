//
//  BottomTextLineView.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/18.
//

import SwiftUI

struct BottomTextLineView: View {
    @ObservedObject var viewModel: MC3ViewModel
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Text("\(viewModel.positionNumberToKnow)번 부위의 마지막 투여일은")
            Text("8일 전").font(.system(size: 15, weight: .bold))
            Text("입니다.")
        }
        .font(.system(size: 15))
        .foregroundColor(.black)
        .padding()
        .background(
            Rectangle()
                .foregroundColor(Color(hex: "007AFF")).opacity(0.19)
                .frame(minWidth: 350)
                .cornerRadius(12)
        )
    }
}

struct BottomTextLineView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTextLineView(viewModel: MC3ViewModel.preview)
    }
}
