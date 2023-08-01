//
//  DateScroll.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI

struct DateScroll: View {
    @StateObject private var viewModel = HistoryViewModel()
    @State var selectedDate = Date()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Date.datesRange(from:selectedDate.startDateOfMonth, to: selectedDate.endDateOfMonth), id: \.timeIntervalSince1970) { page in
                    DayOfMonth(selectedDate: $selectedDate, currentDate: page)
                }
            }
            .padding()
        }.frame(height: 70)
    }
}

struct DateScroll_Previews: PreviewProvider {
    static var previews: some View {
        DateScroll()
    }
}
