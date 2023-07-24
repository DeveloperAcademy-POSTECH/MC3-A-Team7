//
//  Date.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/19.
//

import Foundation
import SwiftUI


extension Date {
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
}

// MARK: - static method

extension Date {
    static func - (lhs: Date, rhs: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -rhs, to: lhs)!
    }
}
