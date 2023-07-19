//
//  TabViewComponents.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/18.
//

import SwiftUI

struct TabViewComponentsView: View {
    @ObservedObject var viewModel: MC3ViewModel
    var body: some View {
        TabView(selection: $viewModel.page) {
            ForEach((0..<2), id: \.self) { page in
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 350)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                    .cornerRadius(12)
                    .overlay {
                        VStack(alignment: .center, spacing: 20) {
                            Spacer()
                            Text("아래").font(.system(size: 17, weight: .semibold))

                            LazyVGrid(columns: viewModel.columns, spacing: 20) {
                                ForEach(Array(page == 0 ? viewModel.arr0.indices : viewModel.arr1.indices)
                                        , id: \.self) { iNumber in
                                    let index = page == 0 ? viewModel.arr0[iNumber] : viewModel.arr1[iNumber]

                                    ZStack {
                                        Circle()
                                            .stroke(Color(hex: viewModel.randomArr.contains(index) ?  "5AC8FA"
                                                          : viewModel.recomNum != index ?  "8E8E93" : "007AFF"),
                                                    lineWidth: 3)
                                        .opacity(page == 0 && viewModel.isTabbed0[iNumber] ? 1 :
                                                 page == 1 && viewModel.isTabbed1[iNumber] ? 1 : 0)
                                            .frame(width: 71, height: 71)
                                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

                                        Circle()
                                            .id(iNumber)
                                            .onTapGesture {
                                                func nextNumRecom() {
                                                    _ = page == 0 ? viewModel.isTabbed0[iNumber].toggle()
                                                    : viewModel.isTabbed1[iNumber].toggle()

                                                    viewModel.pickedNum = index
                                                    viewModel.isClicked = true
                                                }

                                                if viewModel.isNoTabSelected {
                                                    nextNumRecom()
                                                } else {
                                                    viewModel.resetAllTabbedStates()
                                                    nextNumRecom()
                                                }
                                            }
                                            .frame(width: 60, height: 60)
                                            .foregroundColor(
                                                Color(hex: viewModel.randomArr.contains(index) ?  "5AC8FA"
                                                      : viewModel.recomNum != index ?  "8E8E93" : "007AFF"))
                                            .overlay {
                                    if page == 0 && viewModel.isTabbed0[iNumber] ||
                                        page == 1 && viewModel.isTabbed1[iNumber] {
                                                    Image(systemName: "checkmark")
                                                        .bold()
                                                        .foregroundColor(.white)
                                                } else {
                                                    Text(String(index))
                                                }
                                            }
                                    }
                                    .padding(-8)
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
            viewModel.randomeIntArrFunc()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}