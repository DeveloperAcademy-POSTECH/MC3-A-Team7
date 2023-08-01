//
//  HistoryViewModel.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI

final class HistoryViewModel: ObservableObject {
    @Published var selectedDate = Date().start
    @Published var selectedInjection: Injection?
    @Published var showPickerSheet = false
    @Published var showInjectionEditModal = false

    var dateScrollRange: [Date] {
        print(Date.datesRange(from: selectedDate.startDateOfMonth, to: selectedDate.endDateOfMonth))
        return Date.datesRange(from: selectedDate.startDateOfMonth, to: selectedDate.endDateOfMonth)
    }

    var rangeDates: (first: Date, last: Date) {
        let dates = dateScrollRange
        return (first: dates.first ?? Date().startDateOfMonth, last: dates.last ?? Date().endDateOfMonth)
    }
}
