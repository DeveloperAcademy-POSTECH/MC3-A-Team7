//
//  UpdateView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct UpdateView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var viewModel = MC3ViewModel()
    var injection: Injection
    @State private var selectedDate: Date
    @State private var selectedPosition: Int

    init(injection: Injection) {
        self.injection = injection
        let _ = print("UpdateView: \(injection)\n\n\n\n\n\n\n\n\n")
        //        self.date = Date()
        //        self.position = 0
        //        self.date = State(initialValue: injection.wrappedTimestamp)
        //        self.position = State(initialValue: Int(injection.position))
        _selectedDate = State(initialValue: injection.wrappedTimestamp)
        _selectedPosition = State(initialValue: Int(injection.wrappedPosition))
    }

    func deleteInjection () {
        viewModel.buttonDelete(injection: injection)
        dismiss()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("부위 선택")
                            .bold()
                            .padding()
                        Spacer()
                    }
                    UpdateCardView(
                        viewModel: viewModel,
                        selectedPosition: $selectedPosition,
                        originalPosition: Int(injection.position)
                    )
                    Spacer()
                    HStack {
                        Text("날짜 선택")
                            .bold()
                            .padding()
                        Spacer()
                    }
                    DatePickerView(date: $selectedDate)
                    DeleteButton(
                        deleteAction: deleteInjection,
                        selectedDate: selectedDate,
                        selectedPosition: Int(injection.position))
                }
                .navigationTitle("수정하기")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("취소")
                                .foregroundColor(.red)
                        }
                    }
                    // TODO: - 완료 버튼 클릭 시 해당 데이터 수정 -> 확인 필요
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("수정 \(selectedPosition)")
                            PersistenceController.shared.update(time: selectedDate, position: selectedPosition, to: injection)
                            dismiss()
                        } label: {
                            Text("완료")
                        }
                    }
                }
            }
        }
    }
}

//struct UpdateView_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateView(injection: PersistenceController.preview)
//    }
//}
