//
//  TabViewPaperSheetView.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/22.
//

import SwiftUI

struct TabViewPaperSheetView: View {
    @ObservedObject var viewModel: MC3ViewModel
    var page: Int

    var body: some View {
        LazyVGrid(columns: viewModel.columns) {
            let injections = viewModel.injectionsByPositionArray
            ForEach(page == 0 ? viewModel.leftArray : viewModel.rightArray,
                    id: \.self) { position in
                let injection: Injection? = injections[position]
                TabViewCircleView(viewModel: viewModel, injection: injection, position: position)
            }
        }.frame(maxWidth: .infinity)
    }
}

struct TabViewPaperSheetView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MC3ViewModel()
        TabViewPaperSheetView(viewModel: viewModel, page: 1)
    }
}
