//
//  InsulinTypeUnitPickerView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct InsulinTypePickerView: View {
    @Binding var selectedType: Int
    @Binding var hasTypeValueChanged: Bool
    var types = InsulinType.allCases.map { $0.description }

    var body: some View {
        VStack {
            HStack {
                Text("인슐린 타입")
                Spacer()
            }

            Picker("인슐린 타입", selection: $selectedType) {
                ForEach(types.indices, id: \.self) {type in
                    Text(types[type])
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: selectedType) { newValue in
                if newValue != InsulinType.rapidActing.rawValue {
                    hasTypeValueChanged = true
                }
            }
        }
    }
}
