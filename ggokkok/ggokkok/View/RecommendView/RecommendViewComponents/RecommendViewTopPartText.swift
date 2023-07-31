//
//  MainViewTopPartTextBox.swift
//  MC3Prac
//
//  Created by 채영민 on 2023/07/28.
//

import SwiftUI

struct RecommendViewTopPartText: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("오늘도 겹치지 않게 \n다른 부위에 꼭~콕 💉").font(.system(size: 22, weight: .bold))
                Spacer()
            }
        }
    }
}
