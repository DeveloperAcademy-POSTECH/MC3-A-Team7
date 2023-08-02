//
//  EditInjectionView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct EditInjectionView: View {
    @StateObject var viewModel: CreateEditViewModel

    @Environment(\.presentationMode) var presentationMode
    @State private var showingExceptionAlert = false
    @State private var injectionModel: InjectionModel
    @State private var hasDosesValueChanged = false
    @State private var hasTypeValueChanged = false
    var injection: Injection
    private var lastSiteNumber: Int {
        UserInfo.shared.lastSiteNumber }

    init(injection: Injection) {
        self.injection = injection
        _injectionModel = State(initialValue: InjectionModel(injection: injection))
        _viewModel = StateObject(wrappedValue: CreateEditViewModel(injection: injection))
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

                Section(content: {
                    DeleteButtonView(deleteAction: deleteInjection, injection: viewModel.injectionModel)
                }).listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("수정하기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // TODO: - 수정 후 Refresh
                        if viewModel.injectionModel.site > lastSiteNumber {
                            showingExceptionAlert = true
                        }
                        else {
                            update(injection, using: viewModel.injectionModel)
                            dismiss()
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

    private func update(_ injection: Injection, using injectionModel: InjectionModel) {
        PersistenceController.shared.update(
            doses: injectionModel.doses,
            insulinType: injectionModel.insulinType,
            site: injectionModel.site,
            time: injectionModel.timestamp,
            to: injection
        )
    }

    func deleteInjection() {
        PersistenceController.shared.delete(injection: injection)
        dismiss()
    }

    private func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct EditInjectionView_Previews: PreviewProvider {
    static var previews: some View {
        let injection = PersistenceController.shared.onePositionInjection
        EditInjectionView(injection: injection)
    }
}
