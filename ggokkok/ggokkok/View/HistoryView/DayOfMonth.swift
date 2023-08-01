//
//  DayOfMonth.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI

struct DayOfMonth: View {
    @ObservedObject var viewModel: HistoryViewModel
    var currentDate: Date
    var isSelected: Bool { viewModel.selectedDate == currentDate }

    var body: some View {
        Button {
            viewModel.selectedDate = currentDate
        } label: {
            Rectangle()
                .frame(width: 50, height: 70)
                .foregroundColor(isSelected ? Color.blue : Color.white)
                .cornerRadius(10)
                .overlay(
                    VStack {
                        stringDayOfWeekText
                        stringDateText
                    }
                    .foregroundColor(isSelected ? Color.white : Color.black)
                )
        }
    }

    var stringDayOfWeekText: some View {
        Text(currentDate.dayOfWeekString)
            .font(.body.bold())
    }

    var stringDateText: some View {
        Text(currentDate.dayString)
            .font(.title2.bold())
    }
}

struct DayOfMonth_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HistoryViewModel()
        DayOfMonth(viewModel: viewModel, currentDate: Date())
    }
}
