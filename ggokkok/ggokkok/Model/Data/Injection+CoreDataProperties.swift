//
//  Injection+CoreDataProperties.swift
//  GgokKok
//
//  Created by sei on 2023/07/29.
//
//

import Foundation
import CoreData

extension Injection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Injection> {
        return NSFetchRequest<Injection>(entityName: "Injection")
    }

    @NSManaged public var doses: Int32
    @NSManaged public var id: UUID
    @NSManaged public var insulinType: Int16
    @NSManaged public var site: Int16
    @NSManaged public var timestamp: Date

    var wrappedInsulinType: InsulinType {
        get {
            InsulinType(rawValue: insulinType) ?? .rapidActing
        }
        set {
            insulinType = newValue.rawValue
        }
    }

    var wrappedSite: Int {
        get {
            Int(site)
        }
        set {
            site = Int16(newValue)
        }
    }

    var wrappedDoses: Int {
        get {
            Int(doses)
        }
        set {
            doses = Int32(newValue)
        }
    }
}

extension Injection: Identifiable {

}
