//
//  EditInjectionView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct EditInjectionView: View {
    @Environment(\.presentationMode) var presentationMode
//    @State private var date: Date
    @State private var showingExceptionAlert = false

//    @State var injectionSiteNumber: Int
//    @State private var insulinDoses: Int
    @State private var hasDosesValueChanged = false // noel's writing.
//    @State private var selectedType: InsulinType
    @State private var hasTypeValueChanged = false
    @State var injection: Injection
    private var lastSiteNumber: Int { OnboardingViewModel.shared.lastSiteNumber }
//
    init(injection: Injection) {

        _injection = State(initialValue: injection)
//        _injectionSiteNumber = State(initialValue: injection.wrappedSite)
//        _insulinDoses = State(initialValue: injection.wrappedDoses)
//        _selectedType = State(initialValue: injection.wrappedInsulinType)
    }


    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    InjectionSitePickerView(injectionSiteNumber: $injection.wrappedSite)
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    DateTimePickerView(date: $injection.timestamp)
                }).listStyle(InsetGroupedListStyle())

                Section(content: {
                    InsulinTypePickerView(selectedType: $injection.wrappedInsulinType, hasTypeValueChanged: $hasTypeValueChanged)
                    InsulinDosesPickerView(insulinDoses: $injection.wrappedDoses, hasDosesValueChanged: $hasDosesValueChanged)
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
                        if injection.wrappedSite > lastSiteNumber {
                            showingExceptionAlert = true
                        }
                        else {
                            //                        PersistenceController.shared.update(doses: insulinDoses, insulinType: selectedType, site: injectionSiteNumber, time: date, to: injection)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Text("완료")
                    }
                    .alert("주사부위표의 범위를 벗어난 값입니다.", isPresented: $showingExceptionAlert) {
                        Button("확인", role: .cancel) {}
                    }
                }
            }
        }
    }
}

struct EditInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        let injection = PersistenceController.shared.onePositionInjection
        EditInjectionView(injection: injection)
    }
}
