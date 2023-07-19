//
//  UpdateCircleView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct UpdateCircleView: View {
    var selected: Bool = false
    var index: Int = 3
    var isPreviousNumber: Bool = false
    
    var body: some View {
        let backgroundColor = selected ? "0055B1" :
        isPreviousNumber ? "000000" : "E8E8EA"
        Text(String(index))
            .foregroundColor(.white)
            .font(.system(size: 20))
            .padding(20)
            .bold()
            .background(
                Circle()
                    .fill(Color(hex: backgroundColor))
        //                                                .fill(Color(hex: "0055B1"))/
            )
    }
}

struct UpdateCircleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UpdateCircleView(isPreviousNumber: true)
            UpdateCircleView(selected: true)
        }
    }
}
