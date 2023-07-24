//
//  CardView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct UpdateCardView: View {
    @ObservedObject var viewModel: MC3ViewModel
//    @ObservedObject var selectedNum: SelectedData
    @Binding var selectedPosition: Int
    var originalPosition: Int

    var body: some View {
        TabView(selection: $viewModel.page) {
            ForEach((0..<2), id: \.self) { page in
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 350)
                    .background(Color(hex: "F6F6FB"))
                    .cornerRadius(12)
                    .overlay {
                        VStack(alignment: .center, spacing: 20) {
                            Spacer()
                            Text("아래").font(.system(size: 17, weight: .semibold))

                            LazyVGrid(columns: viewModel.columns, spacing: 10) {
                                ForEach(viewModel.leftArray.indices, id: \.self) { iNumber in
                                    let index = page == 0 ? viewModel.leftArray[iNumber] : viewModel.rightArray[iNumber]

                                    ZStack {
                                        Button {
                                            selectedPosition = index
                                        } label: {
                                            UpdateCircleView(selected: selectedPosition == index, index: index, isPreviousNumber: originalPosition == index)
                                        }
                                    }

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
        .onAppear {
//            viewModel.resetAllTabbedStates()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct UpdateCardView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateCardView(viewModel: MC3ViewModel.preview, selectedPosition: .constant(1), originalPosition: 1)
    }
}
