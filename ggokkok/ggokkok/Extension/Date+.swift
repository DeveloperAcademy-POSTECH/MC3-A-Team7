//
//  Date+.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import Foundation

extension Date: Hashable {
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }

    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }

    var fullString: String {
        "\(year)년 \(String(format: "%02d", month))월 \(String(format: "%02d", day))일"
    }

    var numberOnlyString: String {
        "\(year)\(String(format: "%02d", month))\(String(format: "%02d", day))"
    }

    var start: Date {
        Calendar.current.startOfDay(for: self)
    }

    var end: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: start)!
    }

    var startDateOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: Date())
        let startOfMonth = Calendar.current.date(from: components)!
        return startOfMonth
    }

    var endDateOfMonth: Date {
        var components = Calendar.current.dateComponents([.year, .month], from: Date())
        components.month = (components.month ?? 0) + 1
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return endOfMonth
    }
}

// MARK: - static method

extension Date {
    static func - (lhs: Date, rhs: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -rhs, to: lhs)!
    }

    static func + (lhs: Date, rhs: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: rhs, to: lhs)!
    }
    
    static func datesRange(from: Date, to: Date) -> [Date] {
        if from > to { return [Date]() }

        var tempDate = from
        var array = [tempDate]

        while tempDate < to-1 {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            array.append(tempDate)
        }

        return array
    }

    static func from(year: Int = Date().year, month: Int = Date().month, day: Int = Date().day, hour: Int = Date().hour) -> Date {
        let calendar = Calendar(identifier: .gregorian)

        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour

        return calendar.date(from: dateComponents)!
    }
}
