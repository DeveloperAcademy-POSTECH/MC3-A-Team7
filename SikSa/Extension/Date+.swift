//
//  Date.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/19.
//

import Foundation
import SwiftUI

extension Date {
    static func - (lhs: Date, rhs: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -rhs, to: lhs)!
    }
}
