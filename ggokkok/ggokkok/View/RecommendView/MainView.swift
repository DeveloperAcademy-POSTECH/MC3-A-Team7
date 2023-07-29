//
//  MainView.swift
//  MC3Prac
//
//  Created by 채영민 on 2023/07/28.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainViewModel: MainViewModel

    var body: some View {
        VStack {
            MainViewTopPartNavigationIcons()
            MainViewTopPartText()
            MainViewDisplayBoxView()
            MainViewBottomPartTextBox()
            MainViewButtonComponent(mainViewModel: mainViewModel, buttonLabel: "기록하기")
        }
        .padding(.horizontal)
        .sheet(isPresented: $mainViewModel.showSheet) {
            MainViewSheetView(isPresented: $mainViewModel.showSheet)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel()
        MainView(mainViewModel: viewModel)
    }
}
