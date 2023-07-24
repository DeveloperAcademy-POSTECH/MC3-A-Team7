//
//  CardView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct UpdateCardView: View {
    @ObservedObject var viewModel: MC3ViewModel
    @Binding var selectedPosition: Int
    var originalPosition: Int
    @State var pageIndex: Int

    init(viewModel: MC3ViewModel, selectedPosition: Binding<Int>, originalPosition: Int) {
        self.viewModel = viewModel
        self._selectedPosition = selectedPosition
        self.originalPosition = originalPosition
        _pageIndex = State(initialValue: viewModel.leftArray.contains(originalPosition) ? 0 : 1)
    }

    var body: some View {
        TabView(selection: $pageIndex) {
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
                                let array = page == 0 ? viewModel.leftArray : viewModel.rightArray
                                ForEach(array, id: \.self) { position in
                                    ZStack {
                                        Button {
                                            selectedPosition = position
                                        } label: {
                                            UpdateCircleView(selected: selectedPosition == position,
                                                             position: position,
                                                             isPreviousNumber: originalPosition == position)
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
//
//struct UpdateCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateCardView(viewModel: MC3ViewModel.preview, selectedPosition: .constant(1), originalPosition: 1)
//    }
//}
