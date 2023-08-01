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
        Date.datesRange(from: selectedDate.startDateOfMonth, to: selectedDate.endDateOfMonth)
    }
}
