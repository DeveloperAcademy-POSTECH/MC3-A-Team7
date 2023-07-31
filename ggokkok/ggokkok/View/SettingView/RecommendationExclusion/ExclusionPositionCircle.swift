//
//  ExclusionSiteCircle.swift
//  GgokKok
//
//  Created by chaekie on 2023/07/30.
//

import SwiftUI

struct ExclusionSiteCircle: View {
    var viewModel: RecommendationExclusionViewModel
    var site: Int
    var isEditingMode: Bool

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.gray300)
            Text("\(site)")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            if isEditingMode {
                Button {
                    viewModel.removeSiteFromExclusion(site)
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

struct ExclusionSiteCircle_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RecommendationExclusionViewModel(lastSiteNumber: 31)
        ExclusionSiteCircle(viewModel: viewModel, site: 1, isEditingMode: true)
    }
}
