//
//  MainViewTopPartNavigationIcons.swift
//  MC3Prac
//
//  Created by 채영민 on 2023/07/28.
//

import SwiftUI

struct RecommendViewTopPartNavigationIcons: View {
    var body: some View {
        NavigationView {
            HStack {
                Spacer()
                Image(systemName: "calendar")
                    .font(.system(size: 24))
                Image(systemName: "gearshape")
                    .font(.system(size: 24))
            }.foregroundColor(Color.blue300)
        }
        .padding(.vertical)
    }
}
