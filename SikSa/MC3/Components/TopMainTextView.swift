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
            Spacer()
            Text(viewModel.isPositionSelected ? "선택하신 주사 부위는" : "이번 권장 주사 부위는")
                .font(.system(size: 22, weight: .semibold))
            HStack(alignment: .bottom) {
                Text(String(viewModel.positionNumberToKnow))
                    .font(.system(size: 28, weight: .semibold)).foregroundColor(.blue)
                Text("번 입니다.")
                    .font(.system(size: 22, weight: .semibold))
            }
        }
    }
}

struct TopMainTextView_Previews: PreviewProvider {
    static var previews: some View {
        TopMainTextView(viewModel: MC3ViewModel.preview)
    }
}
