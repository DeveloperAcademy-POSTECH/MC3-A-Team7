//
//  DatePickerView.swift
//  newGgok-Kok
//
//  Created by 김수인 on 2023/07/28.
//

import SwiftUI

struct DateTimePickerView: View {
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
        VStack {
            DatePicker(
                "날짜",
                selection: $date,
                in: dateRange,
                displayedComponents: [.date]
            )
            .datePickerStyle(.compact)

            Divider()

            DatePicker(
                "시간",
                selection: $date,
                in: dateRange,
                displayedComponents: [.hourAndMinute]
            )
            .datePickerStyle(.compact)
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DateTimePickerView(date: .constant(Date()))
    }
}
