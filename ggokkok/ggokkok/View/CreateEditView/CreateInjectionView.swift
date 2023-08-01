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

    @State var injectionSiteNumber: Int32 = 0
    @State private var insulinDoses = 1 // noel's writing
    @State private var hasDosesValueChanged = false // noel's writing
    @State private var selectedType = Int(InsulinType.rapidActing.rawValue)
    @State private var hasTypeValueChanged = false

    var body: some View {
        var insulinTypeVariant: InsulinType = InsulinType(rawValue: Int16(selectedType)) ?? InsulinType.rapidActing
        NavigationView {
            List {
                Section(content: {
                    InjectionSitePickerView(injectionSiteNumber: $injectionSiteNumber, siteNumber: 0)
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    DateTimePickerView(date: $date)
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    InsulinTypePickerView(selectedType: $selectedType, hasTypeValueChanged: $hasTypeValueChanged)
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    InsulinDosesPickerView(insulinDoses: $insulinDoses, hasDosesValueChanged: $hasDosesValueChanged)
                }).listStyle(InsetGroupedListStyle())
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
                        PersistenceController.shared.addInjection(
                            doses: insulinDoses, insulinType: insulinTypeVariant, site: 10, time: Date())
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

