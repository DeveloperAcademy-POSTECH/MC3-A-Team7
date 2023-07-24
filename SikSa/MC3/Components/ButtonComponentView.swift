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
            if viewModel.isUnder7DaysTabbed {
                viewModel.under7DaysButtonActivate.toggle()
            } else if !viewModel.isUnder7DaysTabbed && !viewModel.under7DaysButtonActivate {
                viewModel.buttonActionForRecord()

            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(height: 81)
                    .foregroundColor(viewModel.isPositionSelected ? .accentColor : .mainViewDisabledRecord)
                Text("기록하기")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
        .disabled(viewModel.isPositionSelected ? false : true)
    }
}

struct ButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponentView(viewModel: MC3ViewModel())
    }
}
