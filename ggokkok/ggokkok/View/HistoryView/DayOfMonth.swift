//
//  DayOfMonth.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI

struct DayOfMonth: View {
    @StateObject private var viewModel = HistoryViewModel()
    @Binding var selectedDate: Date
    @State var currentDate: Date
    var body: some View {
        let stringDayOfWeek = viewModel.getStringDayOfWeek(date: currentDate)
        let stringDate = viewModel.getStringDate(date: currentDate)
        Button {
            selectedDate = currentDate
        } label: {
            let isSelected = selectedDate == currentDate
            Rectangle()
                .frame(width: 50, height: 70)
                .foregroundColor(isSelected ? Color.blue : Color.red)
                .cornerRadius(10)
                .overlay(
                    VStack {
                        Text(stringDayOfWeek)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(isSelected ? Color.white : Color.black)
                        Text(stringDate)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(isSelected ? Color.white : Color.black)
                    }
                )
        }
    }
}

struct DayOfMonth_Previews: PreviewProvider {
    static var previews: some View {
        DayOfMonth(selectedDate: .constant(Date()), currentDate: Date())
    }
}
