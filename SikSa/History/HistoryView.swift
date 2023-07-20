//
//  HistoryView.swift
//  SikSa
//
//  Created by chaekie on 2023/07/19.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.dismiss) private var dismiss
    @State var previousSelectedDate = "2023년 07월 10일"
    @State var previousSelectedPositions = [5, 6]
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("주사부위")
                        .bold()
                    Spacer()
                }
                InjectionSitesView(previousSelectedPositions: previousSelectedPositions,
                    selectPosition: selectPosition)
            }
            .padding()
            Divider()
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(Array(InjectionModel.previewDataDictionary.keys), id: \.self) { key in
                        if let value = InjectionModel.previewDataDictionary[key] {
                            CardView(dateString: key,
                                     injections: value,
                                     previousSelectedDate: $previousSelectedDate,
                                     previousSelectedPositions: $previousSelectedPositions
                            )
                        }
                    }
                }
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Label("뒤로가기", systemImage: "chevron.backward")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addRecord) {
                    Label("생성하기", systemImage: "plus")
                }
            }
        }
    }
    private func addRecord() {
        print("수정하기 모달 띄우기")
    }
    private func selectPosition() {
        print("날짜 선택2")
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
