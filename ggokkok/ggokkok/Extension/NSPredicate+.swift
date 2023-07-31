//
//  NSPredicate+.swift
//  GgokKok
//
//  Created by sei on 2023/07/31.
//

import Foundation

extension NSPredicate {
    static func injected(at site: Int) -> NSPredicate {
        return NSPredicate(format: "site == %@", String(site))
    }

    static func timestampIn(between startDate: Date, and endDate: Date) -> NSPredicate {
        return NSPredicate(
            format: "timestamp >= %@ AND timestamp <= %@", startDate.start as NSDate,
            endDate.end as NSDate)
    }
}

extension NSPredicate {
    static func && (lhs: NSPredicate, rhs: NSPredicate) -> NSPredicate {
        NSCompoundPredicate(andPredicateWithSubpredicates: [lhs, rhs])
    }

    static func || (lhs: NSPredicate, rhs: NSPredicate) -> NSPredicate {
        NSCompoundPredicate(orPredicateWithSubpredicates: [lhs, rhs])
    }
}
