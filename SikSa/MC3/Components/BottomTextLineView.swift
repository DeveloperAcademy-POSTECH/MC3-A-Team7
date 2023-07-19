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
        Rectangle()
            .foregroundColor(Color(hex: "007AFF")).opacity(0.19)
            .frame(width: 350, height: 34)
            .cornerRadius(12)
            .overlay(
                HStack(alignment: .center, spacing: 5) {
                    if viewModel.isNoTabSelected {
                        Text("\(viewModel.recomNum)번 부위의 마지막 투여일은")
                    } else {
                        Text("\(viewModel.pickedNum)번 부위의 마지막 투여일은")
                    }
                    Text("8일 전").font(.system(size: 15, weight: .bold))
                    Text("입니다.")
                }.font(.system(size: 15)).foregroundColor(.black)
            )
    }
}
