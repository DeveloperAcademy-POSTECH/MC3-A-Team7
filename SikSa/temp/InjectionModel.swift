//
//  InjectionModel.swift
//  SikSa
//
//  Created by chaekie on 2023/07/19.
//

import Foundation

struct InjectionModel: Identifiable {
    var id: Int = UUID().hashValue
    var timestamp: Date = Date()
    let position: Int
}

extension InjectionModel {
    static var previewData: [InjectionModel] {
        [
            // (dayDiff, position)
            (3, 1),
            (5, 2),
            (2, 3),
            (3, 4),
            (3, 5)
        ].map { (dayDiff, position) in
            InjectionModel(id: UUID().hashValue, timestamp: Date() - dayDiff, position: position)
        }
    }
//    static var previewDataDictionary: [String: [InjectionModel]] {
//        [
//            "2023년 07월 11일": (1...8).map { InjectionModel(position: $0) },
//            "2023년 07월 10일": (5...6).map { InjectionModel(position: $0) },
//            "2023년 07월 09일": (19...23).map { InjectionModel(position: $0) },
//            "2023년 07월 08일": (11...15).map { InjectionModel(position: $0) }
//        ]
//    }
    static func convertTimestampFormat (_ timestamp: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년 MM월 dd일"
        return dateFormatter.string(from: timestamp)
    }
    static var previewDataDictionary: [String: [InjectionModel]] = Dictionary(grouping: previewData) { convertTimestampFormat($0.timestamp) }
}
