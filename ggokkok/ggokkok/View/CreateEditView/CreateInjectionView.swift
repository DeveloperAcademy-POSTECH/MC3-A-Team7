//
//  CreateInjectionView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct CreateInjectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var date = Date()

    @State private var insulinUnit = 1 // noel's writing
    @State private var hasDosesValueChanged = false // noel's writing
    @State private var selectedType = "초속형"
    @State private var hasTypeValueChanged = false

    var body: some View {
        NavigationView {
            List {
                InjectionSitePickerView()
                DateTimePickerView(date: $date)
                InsulinTypePickerView(selectedType: $selectedType, hasTypeValueChanged: $hasTypeValueChanged)
                InsulinUnitPickerView(insulinUnit: $insulinUnit, hasDosesValueChanged: $hasDosesValueChanged)
            }
            .navigationTitle("생성하기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("완료")
                    }
                }
            }
        }
    }
}

struct CreateInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateInjectionView()
    }
}

