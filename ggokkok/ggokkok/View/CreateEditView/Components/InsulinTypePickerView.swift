//
//  InsulinTypeUnitPickerView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct InsulinTypePickerView: View {
    @Binding var selectedType: InsulinType
    @Binding var hasTypeValueChanged: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("인슐린 타입")
                Spacer()
            }
            
            Picker("인슐린 타입", selection: $selectedType) {
                ForEach(InsulinType.allCases, id: \.self) {
                    Text($0.description)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: selectedType) { newValue in
                if newValue != InsulinType.rapidActing {
                    if newValue != InsulinType.rapidActing {
                        hasTypeValueChanged = true
                    }
                }
            }
        }
    }
}
