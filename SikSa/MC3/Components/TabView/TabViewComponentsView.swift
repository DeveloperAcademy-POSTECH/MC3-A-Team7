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
                    .foregroundColor(Color(hex: "F6F6FB"))
                    .frame(minWidth: 350)
                    .cornerRadius(12)
                    .overlay {
                        VStack(alignment: .center, spacing: 20) {
                            Spacer()
                            Text("아래").font(.system(size: 17, weight: .semibold))

                            LazyVGrid(columns: viewModel.columns, spacing: 20) {
                                ForEach(viewModel.leftArray.indices, id: \.self) { index in
                                    let number = page == 0 ? viewModel.leftArray[index] : viewModel.rightArray[index]

                                    ZStack {
                                        Circle()
                                            .stroke(
                                                Color(hex: viewModel.recomNum == number ? "5987FE"
                                                      : !viewModel.under7DaysArr.contains(number)
                                                      ?  "C9DBFF" :  "E8E8EA" ),
                                                    lineWidth: 3)
                                            .opacity(page == 0 && viewModel.isTabbed0[index] ? 1 :
                                                        page == 1 && viewModel.isTabbed1[index] ? 1 : 0)
                                            .frame(width: 66, height: 66)
                                        Circle()
                                            .id(index)
                                            .onTapGesture {
                                                func nextNumRecom() {
                                                    _ = page == 0 ? viewModel.isTabbed0[index].toggle()
                                                    : viewModel.isTabbed1[index].toggle()
                                                    viewModel.pickedNum = number
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
                                                Color(hex: viewModel.recomNum == number ? "5987FE"
                                                      : !viewModel.under7DaysArr.contains(number)
                                                      ?  "C9DBFF" :  "E8E8EA" ))
                                            .overlay {
                                                Text(String(number))
                                                    .font(Font.custom("SF Pro Text", size: 19))
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(
                                                        Color(hex: viewModel.recomNum == number ? "ffffff"
                                                              : !viewModel.under7DaysArr.contains(number)
                                                              ? "326BFF" : "ABA1A1"))
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
            viewModel.under7DaysArr = viewModel.under7DaysArrFunc()
            viewModel.listOfDateArr = viewModel.listOfDate()
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("RefreshInjectionPoint"))) { _ in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1 ) {
                viewModel.under7DaysArr = viewModel.under7DaysArrFunc()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
