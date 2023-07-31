//
//  InsulinUnitPickerView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct InsulinUnitPickerView: View {
    @Binding var insulinUnit: Int
    @Binding var hasDosesValueChanged: Bool

    var body: some View {
        VStack {
            HStack {
                Text("인슐린 단위")
                Spacer()
            }
            Stepper(value: $insulinUnit, in: 1...10) {
                Text("\(insulinUnit) 단위")
            }
            .onChange(of: insulinUnit.hashValue) { newValue in
                if newValue != insulinUnit {
                    hasDosesValueChanged = true
                }
            }
        }

    }
}

struct InsulinUnitPickerView_Previews: PreviewProvider {
    static var previews: some View {
        @State var insulinUnit = 1 // noel's writing
        @State var hasValueChanged = false // noel's writing
        InsulinUnitPickerView(insulinUnit: $insulinUnit, hasDosesValueChanged: $hasValueChanged)
    }
}
