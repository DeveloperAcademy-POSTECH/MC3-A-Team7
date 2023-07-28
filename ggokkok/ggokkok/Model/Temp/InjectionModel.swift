//
//  InjectionModel.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import Foundation

struct InjectionModel: Identifiable {
    var id = UUID()
    var site: Int
    var insulinType: Int
    var doses: Int
    var timestamp: Date = Date()
}

extension InjectionModel {
    var insulinTypeEnum: InsulinType? {
        InsulinType(rawValue: insulinType)
    }

    enum InsulinType: Int {
        case rapid = 0, mixed, long
    }

    static var previewData: [InjectionModel] {
        [
            // (dayDiff, position)
            (1, 1, 3, 3),
            (2, 2, 5, 5),
            (3, 3, 8, 2),
            (4, 1, 3, 3),
            (5, 1, 5, 3)
        ].map { (site, insulinType, doses, dayDiff) in
            InjectionModel(id: UUID(), site: site, insulinType: insulinType, doses: doses, timestamp: Date() - dayDiff)
        }
    }

    static func convertTimestampFormat (_ timestamp: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년 MM월 dd일"
        return dateFormatter.string(from: timestamp)
    }
    static var previewDataDictionary: [String: [InjectionModel]] = Dictionary(grouping: previewData) { convertTimestampFormat($0.timestamp) }
}
