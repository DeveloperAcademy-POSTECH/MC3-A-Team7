//
//  HistoryListView.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI

struct ListView: View {
    @State private var selectedInjection = 0
    @State private var showModal: Bool = false
    @Binding var selectedDate: Date

    struct ListItem: Hashable {
        let someObject: TimeType
        let valueObjects: [History]
    }

    var myList: [ListItem] {
        let bList = aList.filter {
            $0.timestamp.day == selectedDate.day
        }
        let aDictionary = Dictionary(grouping: bList) { TimeType(time: $0.timestamp) }

        var list = [ListItem]()
        for key in TimeType.allCases {
            list.append(ListItem(someObject: key, valueObjects: aDictionary[key]!))
        }
        return list


    }

    let aList = [
        History(site: 1, insulinType: .rapidActing, doses: 3, timestamp: Date.from(hour: 1)),
        History(site: 2, insulinType: .longActing, doses: 4, timestamp: Date.from(hour: 5)),
        History(site: 2, insulinType: .mixedActing, doses: 4, timestamp: Date.from(hour: 10)),
        History(site: 2, insulinType: .longActing, doses: 4, timestamp: Date.from(hour: 15)),
        History(site: 2, insulinType: .longActing, doses: 4, timestamp: Date.from(hour: 20)),
        History(site: 2, insulinType: .longActing, doses: 4, timestamp: Date.from(hour: 22))
    ]

    var body: some View {

        List {
            ForEach(myList, id: \.self) { listItem in
                Section(header: Text(listItem.someObject.description)) {
                    ForEach(listItem.valueObjects, id: \.self) { history in
                        Button {
                            showModal = true
                        } label: {
                            HistoryListRowView(history: history)
                        }
                    }
                    .sheet(isPresented: $showModal) {
                        Text("Hello world")
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(selectedDate: .constant(Date()))
    }
}


