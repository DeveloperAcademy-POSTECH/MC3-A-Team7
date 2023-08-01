//
//  HistoryDatePickerView.swift
//  GgokKok
//
//  Created by sei on 2023/08/01.
//

import SwiftUI

struct HistoryDatePickerView: View {
    @ObservedObject var viewModel: HistoryViewModel
    var body: some View {
        VStack {
            DatePicker("",
                       selection: $viewModel.selectedDate,
                       displayedComponents: [.date]
            )
            .datePickerStyle(.wheel)
        }
    }
}

struct HistoryDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HistoryViewModel()
        HistoryDatePickerView(viewModel: viewModel)
    }
}
