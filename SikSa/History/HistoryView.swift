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
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    HStack {
                        Text("주사부위")
                            .font(.title2)
                            .bold()
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    Section(header: SectionHeaderView(previousSelectedPositions: previousSelectedPositions)) {
                        ForEach(InjectionModel.previewDataDictionary.keys.sorted(by: >), id: \.self) { key in
                            if let value = InjectionModel.previewDataDictionary[key] {
                                HistoryCardView(dateString: key,
                                         injections: value,
                                         previousSelectedDate: $previousSelectedDate,
                                         previousSelectedPositions: $previousSelectedPositions
                                )
                            }
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
        print(InjectionModel.previewData)
        print("생성하기 모달 띄우기")
    }
}

struct SectionHeaderView: View {
    var previousSelectedPositions: [Int]
    var body: some View {
        VStack {
            InjectionSitesView(previousSelectedPositions: previousSelectedPositions)
                .padding(.horizontal)
                .padding(.vertical, 10)
            Divider()
        }
        .background(Color(.systemGroupedBackground))
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
