//
//  CreateInjectionView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct CreateInjectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingExceptionAlert = false

    @State private var date = Date()
    @State var injectionSiteNumber = 0
    @State private var insulinDoses = 5 // noel's writing
    @State private var hasDosesValueChanged = false // noel's writing
    @State private var selectedType = InsulinType.rapidActing
    @State private var hasTypeValueChanged = false

    private var lastSiteNumber: Int {
        OnboardingViewModel.shared.lastSiteNumber
    }

    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    // TODO: - 주사 부위 초깃값을 0에서 빈 값으로 바꾸기
                    InjectionSitePickerView(injectionSiteNumber: $injectionSiteNumber)
                }).listStyle(InsetGroupedListStyle())
                
                Section(content: {
                    DateTimePickerView(date: $date)
                }).listStyle(InsetGroupedListStyle())
                
                Section(content: {
                    InsulinTypePickerView(selectedType: $selectedType, hasTypeValueChanged: $hasTypeValueChanged)
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
                        // TODO: - 생성 addInjection 기능 추가
                        // TODO: - 마지막 번호보다 클 경우 alert
                        if injectionSiteNumber > lastSiteNumber {
                            showingExceptionAlert = true
                        }
                        else {
                            PersistenceController.shared.addInjection(doses: insulinDoses, insulinType: selectedType, site: injectionSiteNumber, time: date)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Text("완료")
                    }
                    .disabled(injectionSiteNumber == 0)
                    .alert("주사부위표의 범위를 벗어난 값입니다.", isPresented: $showingExceptionAlert) {
                        Button("확인", role: .cancel) {}
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

