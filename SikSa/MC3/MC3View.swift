//
//  MC3.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/17.
//
import SwiftUI

struct MC3View: View {
    @StateObject private var viewModel = MC3ViewModel()

    var body: some View {
        VStack(alignment: .leading) {

            viewModel.recommendationNum()

            TabViewComponentsView(viewModel: viewModel)

            VStack {
                BottomTextLineView(viewModel: viewModel)

                Spacer()
                ButtonComponentView(viewModel: viewModel)

                Spacer()
            }
            .padding(.leading, 21)

        }
        .onAppear {
            viewModel.resetAllTabbedStates()
            viewModel.tabViewIndicatorDot()
        }
    }
}

struct MC3View_Previews: PreviewProvider {
    static var previews: some View {
        MC3View()
    }
}
