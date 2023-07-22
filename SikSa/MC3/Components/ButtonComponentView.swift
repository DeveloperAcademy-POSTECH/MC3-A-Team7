//
//  ButtonComponentView.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/18.
//

import SwiftUI

struct ButtonComponentView: View {
    @ObservedObject var viewModel: MC3ViewModel

    var body: some View {
        Button {
            if let pickedNumber = viewModel.pickedPosition {
                PersistenceController.shared
                    .addInjection(
                        time: Date(),
                        position: pickedNumber
                    )
            }
            viewModel.pickedPosition = nil
            viewModel.setRecommendedPosition()
        } label: {
            Rectangle()
                .foregroundColor(Color(hex: viewModel.isPositionSelected ? "5887FF" : "CECECE"))
                .frame(width: 350, height: 81)
                .cornerRadius(50)
                .overlay(
                    Text("기록").font(.system(size: 22, weight: .bold)).foregroundColor(.white)
                )
        }
        .disabled(viewModel.isPositionSelected ? false : true)
    }
}

struct ButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponentView(viewModel: MC3ViewModel())
    }
}
