//
//  HistoryListTitleView.swift
//  GgokKok
//
//  Created by sei on 2023/08/01.
//

import SwiftUI

struct HistoryListTitleView: View {
    @ObservedObject var viewModel: HistoryViewModel

    var selectedDate: Date { viewModel.selectedDate }

    var body: some View {
        HStack {
            Text(selectedDate.yearMonthString)
                .font(.largeTitle.bold())
            chevronDown
            Spacer()
        }
        .onTapGesture {
            viewModel.showPickerSheet.toggle()
        }
    }

    var chevronDown: some View {
        Image(systemName: "chevron.down")
            .font(.title.bold())
            .foregroundColor(.blue300)
            .padding(.horizontal, 4)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.blue200)
            )
    }
}

struct HistoryListTitleView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HistoryViewModel()
        HistoryListTitleView(viewModel: viewModel)
    }
}
