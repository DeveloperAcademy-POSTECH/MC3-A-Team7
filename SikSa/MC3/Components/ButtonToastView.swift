//
//  ButtonToastView.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/22.
//

import SwiftUI

struct ButtonToastView: View {
    @ObservedObject var viewModel: MC3ViewModel
    let injection: Injection

    var body: some View {
        ZStack {
            let timestamp = injection.wrappedTimestamp
            let position = injection.wrappedPosition
            let formattedDate = viewModel.formatDate(timestamp)
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(hex: "F7F9FC"))
                    .frame(width: 348, height: 69)
                    .shadow(color: .black.opacity(0.2), radius: 4.5, x: 0, y: 4)

                HStack(spacing: 12) {
                    Image("toastViewCheckMark")
                    VStack(alignment: .leading) {
                            Text("투여 기록을 완료했어요.")
                                .font(.system(size: 16, weight: .semibold))
                            Text("\(position)번 \(formattedDate) ")
                                .opacity(0.6).font(.system(size: 13))
                    }
                }.padding()
            }
                .transition(.asymmetric(insertion: AnyTransition.move(edge: .bottom),
                                        removal: AnyTransition.opacity.animation(.easeOut(duration: 2)))
                )
                .animation(.easeIn, value: viewModel.isToastOnApear)
        }
    }
}

struct ButtonToastView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonToastView(viewModel: MC3ViewModel(), injection: PersistenceController.shared.onePositionInjection)
    }
}