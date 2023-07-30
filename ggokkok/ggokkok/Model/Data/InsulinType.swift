//
//  InsulinType.swift
//  GgokKok
//
//  Created by sei on 2023/07/29.
//

import SwiftUI

enum InsulinType: Int16 {
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
}
