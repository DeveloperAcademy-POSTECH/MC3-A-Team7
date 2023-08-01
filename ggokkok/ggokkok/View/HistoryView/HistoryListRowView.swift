//
//  HistoryListRow.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI

struct HistoryListRowView: View {
    let history: History

    var body: some View {
        HStack {
            Circle()
                .frame(width: 34, height: 38)
                .foregroundColor(.gray300)
                .overlay {
                    Text("\(history.site)")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                }
            Text(history.insulinType.description)
                .foregroundColor(history.insulinType.color)
                .font(.system(size: 17, weight: .semibold))
            Text("\(history.doses)단위")
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .semibold))
        }
    }
}

struct HistoryListRow_Previews: PreviewProvider {
    static var previews: some View {
        let history = History(site: 1, insulinType: .longActing, doses: 5)
        HistoryListRowView(history: history)
    }
}

struct History: Hashable {
    var id = UUID()
    var site: Int
    var insulinType: InsulinType
    var doses: Int
    var timestamp: Date = Date()
}
