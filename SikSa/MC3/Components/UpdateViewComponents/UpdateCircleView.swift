//
//  UpdateCircleView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct UpdateCircleView: View {
    var selected: Bool = false
    var index: Int = 1
    var isPreviousNumber: Bool = false
    
    var body: some View {
        let backgroundColor = selected ? "0055B1" :
        isPreviousNumber ? "CECECE" : "E8E8EA"
        let foregroundColor = selected ? "F2F2F7" :
        isPreviousNumber ? "000000" : "ABA1A1"
        ZStack {
            Circle()
                .fill(Color(hex: backgroundColor))
            Text(String(index))
                .foregroundColor(Color(hex: foregroundColor))
                .font(.title3)
                .padding(20)
                .bold()
        }
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
