//
//  InjectionProperties.swift
//  SikSa
//
//  Created by sei on 2023/07/24.
//

import Foundation

// MARK: - Codable

/// A struct encapsulating the properties of a Quake.
struct InjectionProperties: Decodable {

    // MARK: Codable

    private enum CodingKeys: String, CodingKey {
        case position
        case timestamp
    }

    let id: Int             // UUID
    let timestamp: Double    // 1539187727610
    let position: Int        // 1

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawPosition = try? values.decode(Int.self, forKey: .position)
        let rawTimestamp = try? values.decode(Double.self, forKey: .timestamp)

        // Ignore injection with missing data.
        guard let position = rawPosition,
              let timestamp = rawTimestamp
        else {
            throw InjectionError.missingData
        }

        self.timestamp = timestamp
        self.position = position
        self.id = Int(UUID().hashValue)
    }

    // The keys must have the same name as the attributes of the Quake entity.
}

extension InjectionProperties {
    var dictionaryValue: [String: Any] {
        [
            "id": Int64(id),
            "timestamp": Date(timeIntervalSince1970: TimeInterval(timestamp)),
            "position": Int16(position)
        ]
    }
}
