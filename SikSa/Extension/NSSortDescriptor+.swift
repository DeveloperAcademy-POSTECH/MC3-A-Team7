//
//  NSSortDescriptor+.swift
//  SikSa
//
//  Created by sei on 2023/07/19.
//

import Foundation

extension NSSortDescriptor {
    static func byTimestamp(ascending: Bool) -> NSSortDescriptor {
        NSSortDescriptor(keyPath: \Injection.timestamp, ascending: ascending)
    }
}
