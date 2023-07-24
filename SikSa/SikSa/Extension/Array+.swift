//
//  Array+.swift
//  SikSa
//
//  Created by sei on 2023/07/24.
//

import Foundation

extension Array {
  subscript (safe index: Int) -> Element? {
    return indices ~= index ? self[index] : nil
  }
}
