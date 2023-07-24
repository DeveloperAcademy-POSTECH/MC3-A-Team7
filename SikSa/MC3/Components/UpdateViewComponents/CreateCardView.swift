//
//  CreateCardView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/20.
//

import SwiftUI

struct CreateCardView: View {
    @ObservedObject var viewModel: MC3ViewModel
    @Binding var selectedIndex: Int

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

                                ForEach(viewModel.leftArray.indices) { iNumber in
                                    let index = page == 0 ? viewModel.leftArray[iNumber] : viewModel.rightArray[iNumber]
                                    ZStack {
                                        Button {
                                            selectedIndex = index
                                        } label: {
                                            CreateCircleView(selected: selectedIndex == index, index: index)
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

struct CreateCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCardView(viewModel: MC3ViewModel.preview, selectedIndex: .constant(0))
    }
}
