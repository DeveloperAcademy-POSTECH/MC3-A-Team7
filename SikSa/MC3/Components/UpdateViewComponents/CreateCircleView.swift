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
        var backgroundColor: Color = selected ? .selectedButtonBackground : .unselectedButtonColor
        var foregroundColor: Color = selected ? .createViewSelectedForeground : .createViewUnseletedForeground

        ZStack {
            Circle()
                .fill(backgroundColor)
            Text(String(index))
                .foregroundColor(foregroundColor)
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
