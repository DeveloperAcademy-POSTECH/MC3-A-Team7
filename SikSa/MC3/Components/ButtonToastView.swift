//
//  ButtonToastView.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/22.
//

import SwiftUI

struct ButtonToastView: View {
    @ObservedObject var viewModel: MC3ViewModel
    let injections = PersistenceController.shared.injectionsByPositionArray

    var body: some View {
        ZStack {
            let getDate = injections[viewModel.positionNumberToKnow]?.timestamp
            let dateFormatter = viewModel.formatDate(getDate ?? Date())

            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(hex: "F7F9FC"))
                .frame(width: 324, height: 99)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                .overlay {
                    HStack(spacing: 12) {
                        Text("✅")
                            .font(.system(size: 48))
                            .multilineTextAlignment(.center)
                        VStack(alignment: .leading) {
                            Text("투여 기록을 완료했어요.")
                                .font(.system(size: 20, weight: .semibold))
                            Text("\(viewModel.positionNumberToKnow)번 \(dateFormatter) ")
                        }
                    }
                }
                .transition(.asymmetric(insertion: AnyTransition.move(edge: .bottom),
                                        removal: AnyTransition.move(edge: .leading)))
                .animation(.easeIn)
        }
    }
}

struct ButtonToastView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonToastView(viewModel: MC3ViewModel())
    }
}
