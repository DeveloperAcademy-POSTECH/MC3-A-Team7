//
//  NSSortDescriptor+.swift
//  GgokKok
//
//  Created by sei on 2023/07/31.
//

import Foundation

extension NSSortDescriptor {
    static func byTimestamp(ascending: Bool) -> NSSortDescriptor {
        NSSortDescriptor(keyPath: \Injection.timestamp, ascending: ascending)
    }
}
