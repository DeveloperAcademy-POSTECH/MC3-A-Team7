//
//  DateScroll.swift
//  GgokKok
//
//  Created by 조용현 on 2023/07/31.
//

import SwiftUI

struct DateScroll: View {
    @ObservedObject var viewModel: HistoryViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.dateScrollRange, id: \.timeIntervalSince1970) { date in
                    DayOfMonth(viewModel: viewModel, currentDate: date)
                }
            }
        }.frame(height: 70)
    }
}

struct DateScroll_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HistoryViewModel()
        DateScroll(viewModel: viewModel)
    }
}
