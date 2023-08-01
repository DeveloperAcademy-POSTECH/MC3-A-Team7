//
//  HistoryListRow.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI

struct HistoryListRowView: View {
    let injection: Injection

    var body: some View {
        HStack {
            Circle()
                .frame(width: 34, height: 38)
                .foregroundColor(.gray300)
                .overlay {
                    Text("\(injection.wrappedSite)")
                        .foregroundColor(.white)
                        .font(.headline).fontWeight(.semibold)
                }
            Text(injection.wrappedInsulinType.description)
                .foregroundColor(injection.wrappedInsulinType.color)
                .font(.headline).fontWeight(.semibold)
            Text("\(injection.wrappedDoses)단위")
                .foregroundColor(.black)
                .font(.headline).fontWeight(.semibold)
        }
    }
}

struct HistoryListRow_Previews: PreviewProvider {
    static var previews: some View {
        let injection = PersistenceController.shared.onePositionInjection
        HistoryListRowView(injection: injection)
    }
}
