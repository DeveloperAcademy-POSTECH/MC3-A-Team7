//
//  TabViewComponents.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/18.
//

import SwiftUI

struct TabViewComponentsView: View {
    @ObservedObject var viewModel: MC3ViewModel
    @State var clickedPosition: Int?

    var body: some View {
        TabView(selection: $viewModel.page) {
            ForEach((0..<2), id: \.self) { page in
                Rectangle()
                    .foregroundColor(.boxBackgroundColor)
                    .frame(minWidth: 350)
                    .cornerRadius(12)
                    .overlay {
                        VStack(alignment: .center, spacing: 15) {
                            Spacer()
                            Text("아래").font(.system(size: 17, weight: .semibold))


                            HStack(spacing: 10) {
                                if page == 0 {
                                    Spacer()
                                    TabViewPaperSheetView(viewModel: viewModel, page: page)
                                    Spacer()
                                    TabViewBellyButtonView(page: page)
                                } else {
                                    TabViewBellyButtonView(page: page)
                                    Spacer()
                                    TabViewPaperSheetView(viewModel: viewModel, page: page)
                                    Spacer()
                                }
                            }
                            Text("위").font(.system(size: 17, weight: .semibold))
                            Spacer()
                            Spacer()
                        }
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
