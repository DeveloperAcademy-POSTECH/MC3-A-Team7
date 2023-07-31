//
//  InjectionProperties.swift
//  GgokKok
//
//  Created by sei on 2023/07/31.
//

import Foundation

// MARK: - Codable

/// id: UUID
/// insulinType: Int16
/// doses: Int32
/// site: Int16
/// timestamp: Date

/// A struct encapsulating the properties of a Injection.
struct InjectionProperties: Decodable {

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case doses
        case insulinType
        case site
        case timestamp
    }

    let id: UUID             // UUID
    let doses: Int    // 1539187727610
    let timestamp: Double    // 1539187727610
    let site: Int        // 1
    let insulinType: Int        // 1

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawDoses = try values.decode(Int.self, forKey: .doses)
        let rawTimestamp = try values.decode(Double.self, forKey: .timestamp)
        let rawSite = try values.decode(Int.self, forKey: .site)
        let rawInsulinType = try values.decode(Int.self, forKey: .insulinType)

        // Ignore injection with missing data.
//        guard let site = rawPosition,
//              let timestamp = rawTimestamp
//        else {
//            throw InjectionError.missingData
//        }

        self.id = UUID()
        self.doses = rawDoses
        self.timestamp = rawTimestamp
        self.site = rawSite
        self.insulinType = rawInsulinType
    }

    // The keys must have the same name as the attributes of the Quake entity.
}

extension InjectionProperties {
    var dictionaryValue: [String: Any] {
        [
            "id": id,
            "timestamp": Date(timeIntervalSince1970: TimeInterval(timestamp)),
            "doses": Int32(doses),
            "site": Int16(site),
            "insulinType": Int16(insulinType)
        ]
    }
}
