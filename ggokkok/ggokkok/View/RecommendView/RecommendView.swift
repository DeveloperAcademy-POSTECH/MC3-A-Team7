//
//  RecommendView.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import SwiftUI

struct RecommendView: View {
    @StateObject var recommendModel = RecommendViewModel()
    var body: some View {

        VStack {
            RecommendViewTopPartNavigationIcons()
            RecommendViewTopPartText()
            RecommendViewDisplayBoxView(recommendModel: recommendModel)
            RecommendViewBottomPartTextBox(recommendModel: recommendModel)
            RecommendViewButtonComponent(recommendModel: recommendModel, buttonLabel: "기록하기")
        }
        .padding(.horizontal)
        .sheet(isPresented: $recommendModel.showSheet) {
            RecommendViewSheetView(recommendModel: recommendModel, isPresented: $recommendModel.showSheet)
        }
    }
}

struct RecommendView_Previews: PreviewProvider {
    static var previews: some View {
//        let viewModel = RecommendViewModel()
        RecommendView()
    }
}
