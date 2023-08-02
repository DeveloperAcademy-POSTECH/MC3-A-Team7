//
//  MainViewTopPartNavigationIcons.swift
//  MC3Prac
//
//  Created by 채영민 on 2023/07/28.
//

import SwiftUI

struct RecommendViewTopPartNavigationIcons: View {
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: HistoryView(), label: {
                Image(systemName: "calendar")
            })
            NavigationLink(destination: SettingView(), label: {
                Image(systemName: "gearshape")
            })
        }
        .font(.title2)
        .padding(.vertical)
        .foregroundColor(.blue300)
    }
}
