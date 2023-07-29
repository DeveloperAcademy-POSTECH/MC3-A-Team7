//
//  MainViewButtonComponent.swift
//  MC3Prac
//
//  Created by 채영민 on 2023/07/28.
//

import SwiftUI

struct RecommendViewButtonComponent: View {
    @ObservedObject var recommendModel: RecommendModel
    var buttonLabel: String

    var body: some View {

        Button {
            recommendModel.showSheet.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                .frame(height: UIScreen.main.bounds.height/10.55)
                .foregroundColor(Color.blue300)
                Text(buttonLabel)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical)
    }
}
