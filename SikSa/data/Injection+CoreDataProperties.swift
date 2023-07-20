//
//  Injection+CoreDataProperties.swift
//  SikSa
//
//  Created by sei on 2023/07/19.
//
//

import Foundation
import CoreData

extension Injection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Injection> {
        return NSFetchRequest<Injection>(entityName: "Injection")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var id: Int64
    @NSManaged public var position: Int16

    var wrappedTimestamp: Date {
        timestamp ?? Date()
    }
}

extension Injection: Identifiable {

}
