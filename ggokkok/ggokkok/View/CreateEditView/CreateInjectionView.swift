//
//  CreateInjectionView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct CreateInjectionView: View {
    @Environment(\.presentationMode) var presentationMode

    @StateObject private var viewModel: CreateEditViewModel = CreateEditViewModel(injectionModel: InjectionModel(site: 0, insulinType: .rapidActing, doses: 5))

    @State private var showingExceptionAlert = false
    @State private var hasDosesValueChanged = false
    @State private var hasTypeValueChanged = false

    private var lastSiteNumber: Int {
        OnboardingViewModel.shared.lastSiteNumber
    }

    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    InjectionSitePickerView(siteString: $viewModel.injectionSitePickerString)
                }).listStyle(InsetGroupedListStyle())
                
                Section(content: {
                    DateTimePickerView(date: $viewModel.injectionModel.timestamp)
                }).listStyle(InsetGroupedListStyle())
                
                Section(content: {
                    InsulinTypePickerView(selectedType: $viewModel.injectionModel.insulinType, hasTypeValueChanged: $hasTypeValueChanged)
                    InsulinDosesPickerView(insulinDoses: $viewModel.injectionModel.doses, hasDosesValueChanged: $hasDosesValueChanged)
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
                        // TODO: - 생성하고 Refresh
                        if viewModel.injectionModel.site > lastSiteNumber {
                            showingExceptionAlert = true
                        }
                        else {
                            addInjection()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    } label: {
                        Text("완료")
                    }
                    .disabled(isDoneDisabled)
                    .alert("주사부위표의 범위를 벗어난 값입니다.", isPresented: $showingExceptionAlert) {
                        Button("확인", role: .cancel) {}
                    }
                }
            }
        }
    }

    func addInjection() {
        let injection = viewModel.injectionModel
        PersistenceController.shared.addInjection(
            doses: injection.doses,
            insulinType: injection.insulinType,
            site: injection.site,
            time: injection.timestamp
        )
    }

    var isDoneDisabled: Bool {
        viewModel.injectionModel.site == 0
    }

}

struct CreateInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateInjectionView()
    }
}
