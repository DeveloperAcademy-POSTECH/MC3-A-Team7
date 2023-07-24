//
//  TabViewBellyButtonView.swift
//  SikSa
//
//  Created by 채영민 on 2023/07/22.
//

import SwiftUI

struct TabViewBellyButtonView: View {
    var page: Int

    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("배").multilineTextAlignment(.center)
            .foregroundColor(Color.mainViewRecommendationDateButtonColor)
            Image("bellyButton").blur(radius: 3)
                .rotationEffect(Angle(degrees: page == 0 ? 0 : 180))
            Text("꼽").multilineTextAlignment(.center)
            .foregroundColor(Color.mainViewRecommendationDateButtonColor)
            Spacer()
        }.padding(.top, 15)
    }
}

struct TabViewBellyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBellyButtonView(page: 1)
    }
}
