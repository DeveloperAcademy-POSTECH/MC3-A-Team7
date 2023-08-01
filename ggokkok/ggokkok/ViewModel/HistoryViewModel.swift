//
//  HistoryViewModel.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI

class HistoryViewModel: ObservableObject {
    @Published var word = "Hi"
    @Published var date = Date()
    func getStringDayOfWeek(date: Date) -> String {
        let nowDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "Ko")
        dateFormatter.dateFormat = "EEEEEE"
        let dayOfWeek = dateFormatter.string(from: nowDate)
        return dayOfWeek }
    func getStringDate(date: Date) -> String {
        let nowDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "Ko")
        dateFormatter.dateFormat = "dd"
        let dayOfDate = dateFormatter.string(from: nowDate)
        return dayOfDate }

    func getStringDayOfMonth(date: Date) -> String {
        let nowDate = date
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "Ko")
        dateFormatter.dateFormat = "yyyy월M월"
        let dateOfMonth = dateFormatter.string(from: nowDate)

        return dateOfMonth }
}
