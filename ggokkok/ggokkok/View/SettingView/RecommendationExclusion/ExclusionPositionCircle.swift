//
//  ExclusionPositionCircle.swift
//  GgokKok
//
//  Created by chaekie on 2023/07/30.
//

import SwiftUI

struct ExclusionPositionCircle: View {
    var viewModel: RecommendationExclusionViewModel
    var position: Int
    var isEditingMode: Bool

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.gray300)
            Text("\(position)")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            if isEditingMode {
                Button {
                    viewModel.removePositionFromExclusion(position)
                } label: {
                    GeometryReader { geometry in
                        ZStack {
                            Circle()
                                .foregroundColor(Color.red100)
                                .frame(width: geometry.size.width * 0.30)
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width * 0.15,
                                       height: 2.5)
                        }
                    }
                }
            }
        }

    }
}

struct ExclusionPositionCircle_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RecommendationExclusionViewModel()
        ExclusionPositionCircle(viewModel: viewModel, position: 1, isEditingMode: true)
    }
}
