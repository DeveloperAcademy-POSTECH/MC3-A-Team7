//
//  HistoryView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct HistoryView: View {
    @StateObject private var viewModel = HistoryViewModel()
    @State var showCreateSheet = false
    var body: some View {
        VStack {
            Button {
                showCreateSheet = true
            } label: {
                Text("Add Injection")
            }
            HistoryListTitleView(viewModel: viewModel)
            DateScroll(viewModel: viewModel)
            HistoryListView(viewModel: viewModel)
        }
        .padding()
        .background(Color.blue100)
        .sheet(isPresented: $viewModel.showPickerSheet) {
            HistoryDatePickerView(viewModel: viewModel)
                .presentationDetents([.height(UIScreen.main.bounds.height/3)])
        }
        .sheet(isPresented: $showCreateSheet) {
            CreateInjectionView()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
