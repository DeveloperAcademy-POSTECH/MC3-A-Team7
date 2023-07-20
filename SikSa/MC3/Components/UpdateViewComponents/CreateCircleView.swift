//
//  CreateCircleView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/20.
//

import SwiftUI

struct CreateCircleView: View {
    var selected: Bool = false
    var index: Int = 1
    
    var body: some View {
        let backgroundColor = selected ? "0055B1" : "E8E8EA"
        let foregroundColor = selected ? "F2F2F7" : "ABA1A1"
        
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

struct CreateCircleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CreateCircleView(selected: true)
            CreateCircleView(selected: false)
        }
    }
}
