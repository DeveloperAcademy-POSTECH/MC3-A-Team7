//
//  InsulinDosesPickerView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct InsulinDosesPickerView: View {
    @Binding var insulinDoses: Int
    @Binding var hasDosesValueChanged: Bool

    var body: some View {
        VStack {
            HStack {
                Text("인슐린 단위")
                Spacer()
            }
            Stepper(value: $insulinDoses, in: 1...10) {
                Text("\(insulinDoses) 단위")
            }
            .padding()
            .background(Color("blue100"))
            .cornerRadius(10)
            .onChange(of: insulinDoses.hashValue) { newValue in
                if newValue != insulinDoses {
                    hasDosesValueChanged = true
                }
            }
        }
    }
}

struct InsulinDosesPickerView_Previews: PreviewProvider {
    static var previews: some View {
        @State var insulinDoses = 1 // noel's writing
        @State var hasValueChanged = false // noel's writing
        InsulinDosesPickerView(insulinDoses: $insulinDoses, hasDosesValueChanged: $hasValueChanged)
    }
}
