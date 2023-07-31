//
//  TimeType.swift
//  GgokKok
//
//  Created by sei on 2023/07/29.
//

import Foundation

enum TimeType {
    case wakeUp
    case morning
    case lunch
    case dinner
    case goToBed

    init?(time: Date) {
        switch time.hour {
        case 3...6: self = .wakeUp
        case 7...10: self = .morning
        case 11...16: self = .lunch
        case 17...21: self = .dinner
        case 0...2, 22...23: self = .goToBed
        default: return nil
        }
    }
}
