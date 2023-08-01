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

    @State var injectionSiteNumber: Int32 = 18
    @State private var insulinDoses = 1 // noel's writing.
    @State private var hasDosesValueChanged = false // noel's writing.
    @State private var selectedType = Int(InsulinType.rapidActing.rawValue)
    @State private var hasTypeValueChanged = false
//    var injection: Injection
//
//    init(injection: Injection) {
//        self.injection = injection
//        _injectionSiteNumber = State(initialValue: injection.wrappedSite)
//        _insulinDoses = State(initialValue: injection.wrappedDoses)
//        _selectedType = State(initialValue: injection.wrappedInsulinType)
//    }


    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    InjectionSitePickerView(injectionSiteNumber: $injectionSiteNumber)
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    DateTimePickerView(date: $date)
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    InsulinTypePickerView(selectedType: $selectedType, hasTypeValueChanged: $hasTypeValueChanged)
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
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // TODO: - 수정 기능 추가
                        // TODO: - 마지막 번호보다 클 경우 alert
//                        PersistenceController.shared.update(doses: insulinDoses, insulinType: selectedType, site: injectionSiteNumber, time: date, to: injection)
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
