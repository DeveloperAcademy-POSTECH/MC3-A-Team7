//
//  RecommendationExclusionViewModel.swift
//  SikSa
//
//  Created by chaekie on 2023/07/29.
//

import Foundation

class RecommendationExclusion: ObservableObject {
    @Published var positions = Array(1...10)
    @Published var exclusionPositions: [Int] = []
    @Published var newExclusionPositions: [Int] = []
    @Published var updatedPositions: [Int] = []

    init() {
        self.newExclusionPositions = self.exclusionPositions
    }

    func addPositionToExclusion(_ selectedPosition: Int ) {
        if self.exclusionPositions.contains(selectedPosition) {
            
        } else {
            //        self.positions = self.positions.filter { $0 != selectedPosition }
            self.exclusionPositions.append(selectedPosition)
            self.newExclusionPositions = self.exclusionPositions
        }
    }
    func removePositionFromExclusion(_ position: Int) {
        self.newExclusionPositions = self.newExclusionPositions.filter { $0 != position }
        self.updatedPositions.append(position)
    }
    func saveUpdatedPositions() {
        if self.exclusionPositions != self.newExclusionPositions {
            self.exclusionPositions = self.newExclusionPositions
            //            self.positions.append(contentsOf: self.updatedPositions)
        }
    }
}
