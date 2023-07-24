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
    private var injectionDictionary: [String: [Injection]]
    @State private var previousSelectedDate: String
    @State private var previousSelectedPositions: [Int]

    init() {
        injectionDictionary = Self.buildDictionary(using: PersistenceController.shared.injections)
        let firstKey = injectionDictionary.keys.sorted(by: >).first ?? ""
        _previousSelectedDate = State(initialValue: String(firstKey))
        _previousSelectedPositions = State(initialValue: injectionDictionary[firstKey]?.map({ injection in
            injection.wrappedPosition
        }) ?? [])
    }
    @State private var showCreateModal = false
    @State private var isUpdateModalPresented = false

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
                        ForEach(injectionDictionary.keys.sorted(by: >), id: \.self) { key in
                            if let value = injectionDictionary[key] {
                                HistoryCardView(dateString: key,
                                                injections: .constant(value),
                                                previousSelectedDate: $previousSelectedDate,
                                                previousSelectedPositions: $previousSelectedPositions,
                                                isUpdateModalPresented: $isUpdateModalPresented
                                )
                            }
                        }
                    }
                }
            }
        }
        .background(Color.viewBackgroundBlueColor)
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
                Button {
                    addRecord()
                    self.showCreateModal = true
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.blue)
                }.sheet(isPresented: self.$showCreateModal) {
                    CreateView()
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
        .background(Color.viewBackgroundBlueColor)
    }
}

//struct HistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryView()
//    }
//}
