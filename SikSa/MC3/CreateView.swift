//
//  CreateView.swift
//  SikSa
//
//  Created by 김수인 on 2023/07/20.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = MC3ViewModel()
    @State var createNumber: Int = 0
    @State private var selectedIndex = 0
    @State private var date = Date()

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

                    CreateCardView(viewModel: viewModel, selectedIndex: $selectedIndex)

                    Spacer()

                    HStack {
                        Text("날짜 선택")
                            .bold()
                            .padding()
                        Spacer()
                    }

                    DatePickerView(date: $date)
                }
                .navigationTitle("생성하기")
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

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            PersistenceController.shared.addInjection(time: date, position: selectedIndex)
                            dismiss()
                        } label: {
                            Text("추가")
                        }
                        .disabled(selectedIndex == 0)
                    }
                }
            }
        }
    }
}

//struct CreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateView()
//    }
//}
