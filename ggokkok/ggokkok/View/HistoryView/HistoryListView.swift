//
//  HistoryListView.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI
import CoreData

struct HistoryListView: View {
    @ObservedObject var viewModel: HistoryViewModel
    private var injections: [Injection]

    init(viewModel: HistoryViewModel) {
        self.viewModel = viewModel
        let injectionRequest: NSFetchRequest<Injection> = Injection.fetchRequest()
        injectionRequest.sortDescriptors = [.byTimestamp(ascending: false)]
        injectionRequest.predicate = .timestampIn(
            between: viewModel.selectedDate.start,
            and: viewModel.selectedDate.end
        )
        injections = (try? PersistenceController.shared.container.viewContext.fetch(injectionRequest)) ?? []
    }


    var body: some View {
        if listItems.isEmpty {
            emptyView
        } else {
            historyList
        }
    }

    var emptyView: some View {
        VStack {
            Spacer()
            Text("이 날의 기록이 없습니다")
                .foregroundColor(.gray500)
            Spacer()
        }

    }

    var historyList: some View {
        List {
            ForEach(listItems, id: \.self) { listItem in
                Section(header: Text(listItem.timeType.description)) {
                    ForEach(listItem.injections, id: \.self) { injection in
                        Button {
                            viewModel.selectedInjection = injection
                            viewModel.showInjectionEditModal = true
                        } label: {
                            HistoryListRowView(injection: injection)
                        }
                    }
                    .sheet(isPresented: $viewModel.showInjectionEditModal) {
                        EditInjectionView(injection: viewModel.selectedInjection!)
                    }
                }
            }
        }
    }
}

extension HistoryListView {
    private struct ListItem: Hashable {
        let timeType: TimeType
        let injections: [Injection]
    }

    private var listItems: [ListItem] {
        let injectionDictionary = Dictionary(grouping: injections) { TimeType(time: $0.timestamp) }

        return injectionDictionary.reduce(into: []) { (partialResult: inout [ListItem], dictionary: (key: TimeType?, value: [Injection])) in
            if let key = dictionary.key {
                partialResult.append(ListItem(timeType: key, injections: dictionary.value))
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HistoryViewModel()
        HistoryListView(viewModel: viewModel)
    }
}
