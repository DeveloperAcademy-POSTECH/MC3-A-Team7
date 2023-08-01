//
//  InsulinTypeUnitPickerView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct InsulinTypePickerView: View {
    @Binding var selectedType: String
    @Binding var hasTypeValueChanged: Bool
    var types = ["지속형", "초속형", "혼합형"]

    var body: some View {
        VStack {
            HStack {
                Text("인슐린 타입")
                Spacer()
            }

            Picker("인슐린 타입", selection: $selectedType) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: selectedType) { newValue in
                if newValue != "초속형" {
                    hasTypeValueChanged = true
                }
            }
        }
    }
}

struct InsulinTypeUnitPickerView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedType = "초속형"
        @State var hasValueChanged = false // noel's writing
        InsulinTypePickerView(selectedType: $selectedType, hasTypeValueChanged: $hasValueChanged)
    }
}