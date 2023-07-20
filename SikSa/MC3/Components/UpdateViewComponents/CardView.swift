//
//  CardView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: MC3ViewModel
    @ObservedObject var selectedNum: SelectedNum
    @State var selectedIndex: Int = 1

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
                        
                            
                            LazyVGrid(columns: viewModel.columns, spacing: 20) {
                                ForEach(Array(page == 0 ? viewModel.leftArray.indices : viewModel.rightArray.indices)
                                        , id: \.self) { iNumber in
                                    let index = page == 0 ? viewModel.leftArray[iNumber] : viewModel.rightArray[iNumber]
                                    
                                    ZStack {
                                        Button {
                                            print("hi")
                                            selectedIndex = index
                                        } label: {
                                            UpdateCircleView(selected: selectedIndex == index, index: index, isPreviousNumber: selectedNum.selectedIndex == index)
                                        }
                                    }
                                    

//                                    ZStack {
//                                        Circle()
//                                            .id(iNumber)
//                                            .onTapGesture {
//                                                func nextNumRecom() {
//                                                    _ = page == 0 ? viewModel.isTabbed0[iNumber].toggle()
//                                                    : viewModel.isTabbed1[iNumber].toggle()
//
//                                                    viewModel.pickedNum = index
//                                                    viewModel.isClicked = true
//                                                }
//
//                                                if viewModel.isNoTabSelected {
//                                                    nextNumRecom()
//                                                } else {
//                                                    viewModel.resetAllTabbedStates()
//                                                    nextNumRecom()
//                                                }
//                                            }
//                                            .frame(width: 60, height: 60)
//                                            .foregroundColor(
//                                                Color(hex: viewModel.randomArr.contains(index) ?  "5AC8FA"
//                                                      : viewModel.recomNum != index ?  "8E8E93" : "007AFF"))
//                                            .overlay {
//                                                Text(String(index))
//                                            }
//                                    }
//                                    .padding(-8)
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
            viewModel.resetAllTabbedStates()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(viewModel: MC3ViewModel.preview, selectedNum: SelectedNum())
    }
}
