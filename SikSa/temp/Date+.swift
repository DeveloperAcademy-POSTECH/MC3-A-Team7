//
//  Date+.swift
//  SikSa
//
//  Created by chaekie on 2023/07/19.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -rhs, to: lhs)!
    }
}
