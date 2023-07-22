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
                    .foregroundColor(Color(hex: "F6F6FB"))
                    .frame(minWidth: 350)
                    .cornerRadius(12)
                    .overlay {
                        VStack(alignment: .center, spacing: 20) {
                            Spacer()
                            Text("아래").font(.system(size: 17, weight: .semibold))

                            LazyVGrid(columns: viewModel.columns) {
                                let injections = PersistenceController.shared.injectionsByPositionArray
                                ForEach(page == 0 ? viewModel.leftArray : viewModel.rightArray,
                                        id: \.self) { position in
                                    let status = viewModel.getCircleStatus(of: position, using: injections)
                                    TabViewCircleView(viewModel: viewModel, position: position, status: status)
                                }
                            }
                            .padding(.horizontal, 30)
                            Text("위").font(.system(size: 17, weight: .semibold))
                            Spacer()
                        }.padding(.top, -20)
                    }
            }
        }
        .frame(height: 428)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
