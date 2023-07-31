//
//  InsulinUnitPickerView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct InsulinUnitPickerView: View {
    @State private var insulinUnit = 1

    var body: some View {
        VStack {
            HStack {
                Text("인슐린 단위")
                Spacer()
            }
            Stepper(value: $insulinUnit, in: 1...10) {
                Text("\(insulinUnit) 단위")
            }
        }
    }
}

struct InsulinUnitPickerView_Previews: PreviewProvider {
    static var previews: some View {
        InsulinUnitPickerView()
    }
}
