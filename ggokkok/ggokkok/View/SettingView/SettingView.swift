//
//  SettingView.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import SwiftUI

struct SettingView: View {
    static let lastSiteNumber = UserDefaults.standard.integer(forKey: UserDefaultsKey.lastSiteNumber.rawValue)
    @StateObject var viewModel = RecommendationExclusionViewModel(lastSiteNumber: Self.lastSiteNumber)
    var body: some View {
        RecommendationExclusionView(viewModel: viewModel)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
