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
        VStack(alignment: .center) {

            HStack {
                TopMainTextView(viewModel: viewModel)
                Spacer()
            }

            TabViewComponentsView(viewModel: viewModel)
            BottomTextLineView(viewModel: viewModel)
            ButtonComponentView(viewModel: viewModel)
        }
        .padding(.horizontal)
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
