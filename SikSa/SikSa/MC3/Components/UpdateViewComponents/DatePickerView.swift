//
//  DatePickerView.swift
//  Ggok-kok
//
//  Created by 김수인 on 2023/07/19.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var date: Date

    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2022, month: 7, day: 19)
        let endComponents = DateComponents(year: 2023, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from: startComponents)!
            ...
            calendar.date(from: endComponents)!
    }()

    var body: some View {
        DatePicker(
            "맞은 날짜",
            selection: $date,
            in: dateRange,
            displayedComponents: [.date]
        )
        .datePickerStyle(.compact)
        .padding()
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(date: .constant(Date()))
    }
}