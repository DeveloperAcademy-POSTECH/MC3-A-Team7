//
//  EditInjectionView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct EditInjectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var date = Date()

    @State var injectionSiteNumber = 18
    @State private var insulinDoses = 1 // noel's writing.
    @State private var hasDosesValueChanged = false // noel's writing.
    @State private var selectedType = InsulinType.rapidActing
    @State private var hasTypeValueChanged = false

    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    InjectionSitePickerView(injectionSiteNumber: $injectionSiteNumber, siteNumber: Int(injectionSiteNumber))
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

                Section(content: {
                    DeleteButtonView()
                }).listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("수정하기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
//                        PersistenceController.shared.update(doses: <#T##Int#>, insulinType: <#T##InsulinType#>, site: <#T##Int#>, time: <#T##Date#>, to: <#T##Injection#>)
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

struct EditInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        EditInjectionView()
    }
}
