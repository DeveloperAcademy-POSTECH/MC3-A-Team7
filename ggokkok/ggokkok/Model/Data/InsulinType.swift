//
//  InsulinType.swift
//  GgokKok
//
//  Created by sei on 2023/07/29.
//

import SwiftUI

enum InsulinType: Int16, CaseIterable {
    case rapidActing = 0
    case mixedActing
    case longActing

    var color: Color {
        switch self {
        case .rapidActing:
            return Color.rapidActing
        case .mixedActing:
            return Color.mixedActing
        case .longActing:
            return Color.longActing
        }
    }

    var description: String {
        switch self {
        case .rapidActing:
            return "초속형"
        case .mixedActing:
            return "혼합형"
        case .longActing:
            return "지속형"
        }
    }
}
