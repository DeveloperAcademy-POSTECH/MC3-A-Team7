//
//  RecommendationExclusionViewModel.swift
//  SikSa
//
//  Created by chaekie on 2023/07/29.
//

import Foundation

class RecommendationExclusion: ObservableObject {
    @Published var positions = Array(1...31)
    @Published var exclusionPositions: [Int] = []
    @Published var newExclusionPositions: [Int] = []

    init() {
        self.newExclusionPositions = self.exclusionPositions
    }

    func addPositionToExclusion(_ selectedPosition: Int ) {
        self.exclusionPositions.append(selectedPosition)
        self.exclusionPositions.sort()
        self.newExclusionPositions = self.exclusionPositions
    }
    func removePositionFromExclusion(_ position: Int) {
        self.newExclusionPositions = self.newExclusionPositions.filter { $0 != position }
    }
    func saveUpdatedPositions() {
        if self.exclusionPositions != self.newExclusionPositions {
            self.exclusionPositions = self.newExclusionPositions
        }
    }
}
