//
//  NSPredicate+.swift
//  SikSa
//
//  Created by sei on 2023/07/19.
//

import Foundation

extension NSPredicate {
    static func injected(at position: Int) -> NSPredicate {
        return NSPredicate(format: "position == %@", String(position))
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
