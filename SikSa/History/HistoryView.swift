//
//  HistoryView.swift
//  SikSa
//
//  Created by chaekie on 2023/07/19.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.dismiss) private var dismiss
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Injection.timestamp, ascending: true)]
    )
    private var injections: FetchedResults<Injection>
    @State private var previousSelectedDate: String
    @State private var previousSelectedPositions: [Int]
    var injectionDictionary: [String: [Injection]]

    init() {
        injectionDictionary = Self.buildDictionary(using: PersistenceController.shared.injections)
//        injectionDictionary = Self.buildDictionary(using: injections)
        let firstKey = injectionDictionary.keys.sorted(by: >).first ?? "2023년 07월 22일"
        _previousSelectedDate = State(initialValue: String(firstKey))
        _previousSelectedPositions = State(initialValue: injectionDictionary[firstKey]?.map({ injection in
            injection.wrappedPosition
        }) ?? [5, 6])
    }

    var body: some View {
        let _ = print(injections)
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
                        ForEach(injectionDictionary.keys.sorted(by: >), id: \.self) { key in
                            if let value = injectionDictionary[key] {
                                HistoryCardView(dateString: key,
                                                injections: .constant(value),
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
        print("생성하기 모달 띄우기")
    }
    static func convertTimestampFormat (_ timestamp: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY년 MM월 dd일"
        return dateFormatter.string(from: timestamp)
    }

    //    static func buildDictionary(using injections: FetchedResults<Injection>) -> [String: [Injection]] {
    static func buildDictionary(using injections: [Injection]) -> [String: [Injection]] {
        return Dictionary(grouping: injections) {
            Self.convertTimestampFormat($0.wrappedTimestamp)
        }
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

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
