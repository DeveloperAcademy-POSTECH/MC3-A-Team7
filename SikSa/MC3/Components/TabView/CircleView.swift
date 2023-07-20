////
////  CircleView.swift
////  SikSa
////
////  Created by sei on 2023/07/19.
////
//
//import SwiftUI
//
//struct CircleView: View {
//    @ObservedObject var viewModel: MC3ViewModel
//    var page: Int
//    var iNumber: Int
//    var index: Int
//
//    var body: some View {
//        ZStack {
//            Circle()
//                .stroke(Color(hex: viewModel.randomArr.contains(index) ?  "5AC8FA"
//                              : viewModel.recomNum != index ?  "8E8E93" : "007AFF"),
//                        lineWidth: 3)
//            .opacity(page == 0 && viewModel.isTabbed0[iNumber] ? 1 :
//                     page == 1 && viewModel.isTabbed1[iNumber] ? 1 : 0)
//                .frame(width: 71, height: 71)
//                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
//
//            Circle()
//                .id(iNumber)
//                .onTapGesture {
//                    func nextNumRecom() {
//                        _ = page == 0 ? viewModel.isTabbed0[iNumber].toggle()
//                        : viewModel.isTabbed1[iNumber].toggle()
//
//                        viewModel.pickedNum = index
//                        viewModel.isClicked = true
//                    }
//
//                    if viewModel.isNoTabSelected {
//                        nextNumRecom()
//                    } else {
//                        viewModel.resetAllTabbedStates()
//                        nextNumRecom()
//                    }
//                }
//                .frame(width: 60, height: 60)
//                .foregroundColor(
//                    Color(hex: viewModel.randomArr.contains(index) ?  "5AC8FA"
//                          : viewModel.recomNum != index ?  "8E8E93" : "007AFF"))
//                .overlay {
//        if page == 0 && viewModel.isTabbed0[iNumber] ||
//            page == 1 && viewModel.isTabbed1[iNumber] {
//                        Image(systemName: "checkmark")
//                            .bold()
//                            .foregroundColor(.white)
//                    } else {
//                        Text(String(index))
//                    }
//                }
//        }
//        .padding(-8)
//    }
//}
//
//struct CircleView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = MC3ViewModel()
//        let (page, iNumber, index) = (0, 0, 0)
//        CircleView(viewModel: viewModel, page: page, iNumber: iNumber, index: index)
//    }
//}
