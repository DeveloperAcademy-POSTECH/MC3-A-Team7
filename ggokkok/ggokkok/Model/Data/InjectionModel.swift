//
//  InjectionModel.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import Foundation

struct InjectionModel {
    var site: Int
    var insulinType: InsulinType
    var doses: Int
    var timestamp: Date

    init(site: Int, insulinType: InsulinType, doses: Int, timestamp: Date = Date()) {
        self.site = site
        self.insulinType = insulinType
        self.doses = doses
        self.timestamp = timestamp
    }

    init(injection: Injection) {
        site = injection.wrappedSite
        insulinType = injection.wrappedInsulinType
        doses = injection.wrappedDoses
        timestamp = injection.timestamp
    }
}
