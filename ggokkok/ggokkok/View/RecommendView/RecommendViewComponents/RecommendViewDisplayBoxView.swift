//
//  MainViewDisplayBoxView.swift
//  MC3Prac
//
//  Created by 채영민 on 2023/07/28.
//

import SwiftUI

struct RecommendViewDisplayBoxView: View {
    @ObservedObject var recommendModel: RecommendViewModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(height: UIScreen.main.bounds.height/2)
                .foregroundColor(Color.blue100)
                .overlay {
                    VStack {
                        Text("이번 권장 주사 부위는").font(.system(size: 22, weight: .bold))
                        Circle()
                            .padding()
                            .foregroundColor(Color.blue300)
                            .shadow(color: .black.opacity(0.2), radius: 4.5, x: 0, y: 4)
                            .overlay {
                                Text(String(recommendModel.recommend.site))
                                    .font(.system(size: 140, weight: .bold)).foregroundColor(.white)
                            }
                    }.padding()
                }
        }
    }
}
