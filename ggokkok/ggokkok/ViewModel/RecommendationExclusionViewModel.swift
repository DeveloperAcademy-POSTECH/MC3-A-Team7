//
//  RecommendationExclusionViewModel.swift
//  SikSa
//
//  Created by chaekie on 2023/07/29.
//

import Foundation

class RecommendationExclusionViewModel: ObservableObject {
    @Published var positions = Array(1...31)
    @Published var exclusionPositions: [Int] = []
    @Published var newExclusionPositions: [Int] = []

    init() {
        newExclusionPositions = exclusionPositions
    }

    func addPositionToExclusion(_ selectedPosition: Int ) {
        newExclusionPositions = (newExclusionPositions + [selectedPosition]).sorted()
        exclusionPositions = newExclusionPositions
    }
    func removePositionFromExclusion(_ position: Int) {
        newExclusionPositions = newExclusionPositions.filter { $0 != position }
    }
    func saveUpdatedPositions() {
        if exclusionPositions != newExclusionPositions {
            exclusionPositions = newExclusionPositions
        }
    }
}
