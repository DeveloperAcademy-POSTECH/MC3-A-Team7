//
//  SettingView.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import SwiftUI

struct SettingView: View {
    @StateObject var viewModel = RecommendationExclusionViewModel()
    var body: some View {
        RecommendationExclusionView(viewModel: viewModel)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
