//
//  UpdateCircleView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct UpdateCircleView: View {
    var selected: Bool = false
    var position: Int
    var isPreviousNumber: Bool = false

    var body: some View {
        let backgroundColor: Color = selected ? .selectedButtonBackground :
        isPreviousNumber ? .updateViewSelectedIsPreviousBackground : .unselectedButtonColor
        let foregroundColor: Color = selected ? .createViewSelectedForeground :
        isPreviousNumber ? .updateViewUnselectedIsPreviousForeground : .updateViewUnselectedIsNotPreviousForeground
        ZStack {
            Circle()
                .fill(backgroundColor)
            Text(String(position))
                .foregroundColor(foregroundColor)
                .font(.title3)
                .padding(20)
                .bold()
        }
    }
}

struct UpdateCircleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UpdateCircleView(position: 1, isPreviousNumber: true)
            UpdateCircleView(selected: true, position: 10)
        }
    }
}
