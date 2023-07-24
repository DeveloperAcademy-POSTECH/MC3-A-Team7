//
//  HistoryCardView.swift
//  SikSa
//
//  Created by chaekie on 2023/07/19.
//

import SwiftUI

struct HistoryCardView: View {
    var dateString: String
    var injections: [InjectionModel]
    @Binding var previousSelectedDate: String
    @Binding var previousSelectedPositions: [Int]
    @State var isNumberSelected = false
    var body: some View {
        VStack {
            DateButton(dateString: dateString,
                       previsouSelectedDate: previousSelectedDate,
                       selectDate: selectDate)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(injections) { injection in
                        NumberingButton(dateString: dateString,
                                        previsouSelectedDate: previousSelectedDate,
                                        selectDate: selectDate,
                                        position: injection.position)
                    }
                }
                .padding(.vertical, 7)
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(12)
        }
        .padding()
    }
    private func selectDate () {
        if previousSelectedDate != dateString {
            previousSelectedDate = dateString
            previousSelectedPositions = injections.map { $0.position }
        }
    }
}

struct DateButton: View {
    var dateString: String
    var previsouSelectedDate: String
    var selectDate: () -> Void
    var body: some View {
        Button {
            selectDate()
        } label: {
            HStack {
                Text(dateString)
                    .font(.headline)
                    .foregroundColor(previsouSelectedDate == dateString ? .white : .blue)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(previsouSelectedDate == dateString ? .blue : Color(.systemGray5))
                    .cornerRadius(30)
                Spacer()
            }
        }
    }
}

struct NumberingButton: View {
    var dateString: String
    var previsouSelectedDate: String
    var selectDate: () -> Void
    var position: Int
    @State var isCircleSelected = false
    @State private var showUpdateModal = false

    var body: some View {
        Button {
            selectDate()
            self.showUpdateModal = true
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(previsouSelectedDate == dateString ? .blue : Color(.systemGray5))
                    .frame(width: 60, height: 60)
                Text(String(position))
                    .foregroundColor(previsouSelectedDate == dateString ? .white : Color(.systemGray2))
                    .font(.headline)
            }.sheet(isPresented: self.$showUpdateModal) {
                UpdateView(injection: PersistenceController.shared.onePositionInjection)
            }
        }
    }
}

struct HistoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCardView(dateString: "2023년 07월 13일",
                 injections: [InjectionModel(id: UUID().hashValue, timestamp: Date(), position: 1)],
                 previousSelectedDate: .constant("2023년 07월 13일"),
                 previousSelectedPositions: .constant([5, 6]))
        }
}
