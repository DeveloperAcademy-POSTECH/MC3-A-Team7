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
            viewModel.nextNumRecom()
            viewModel.isClicked = false
            viewModel.resetAllTabbedStates()
            if let pickedNumber = viewModel.pickedNum {
                PersistenceController.shared
                    .addInjection(
                        time: Date(),
                        position: pickedNumber
                    )
            }

        } label: {
            Rectangle()
                .foregroundColor(Color(hex: viewModel.isNoTabSelected ? "CECECE" : "4579FF"))
                .frame(width: 350, height: 81)
                .cornerRadius(50)
                .overlay(
                    Text("기록").font(.system(size: 22, weight: .bold)).foregroundColor(.white)
                )
        }
        .disabled(viewModel.isNoTabSelected ? true : false)
    }
}

struct ButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponentView(viewModel: MC3ViewModel())
    }
}
