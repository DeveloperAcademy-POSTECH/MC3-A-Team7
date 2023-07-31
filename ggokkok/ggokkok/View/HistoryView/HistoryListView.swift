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

    var aList = [History(site: 1, insulinType: 2, doses: 3), History(site: 2, insulinType: 3, doses: 4)]

    var body: some View {

        let bList = aList.filter { $0.timestamp.day == selectedDate.day }

        List {
            Section(header: Text("기상직후")) {
                ForEach(bList, id: \.self) { list in
                    Button {
                        showModal = true
                    } label: {
                        
                    }
                }
                .sheet(isPresented: $showModal) {
                    Text("Hello world")
                }
            }.listStyle(InsetGroupedListStyle())
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(selectedDate: .constant(Date()))
    }
}

struct History: Hashable {
    var id = UUID()
    var site: Int
    var insulinType: Int
    var doses: Int
    var timestamp: Date = Date()
}
