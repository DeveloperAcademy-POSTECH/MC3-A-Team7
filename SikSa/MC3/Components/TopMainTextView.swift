//
//  TopMainTextView.swift
//  SikSa
//
//  Created by sei on 2023/07/19.
//

import SwiftUI

struct TopMainTextView: View {
    @ObservedObject var viewModel: MC3ViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(viewModel.isPositionSelected ? "선택하신 주사 부위는" : "이번 권장 주사 부위는")
                Spacer()
            }
            HStack(alignment: .bottom) {
                Text(String(viewModel.positionNumberToKnow))
                    .foregroundColor(.mainView7daysAfterTextColor)
                    .font(.title)
                Text("번 입니다.")            }
        }
        .font(.title2)
        .bold()
    }
}

struct TopMainTextView_Previews: PreviewProvider {
    static var previews: some View {
        TopMainTextView(viewModel: MC3ViewModel.preview)
    }
}
