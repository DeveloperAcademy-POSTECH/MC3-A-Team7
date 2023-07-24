//
//  HistoryCardView.swift
//  SikSa
//
//  Created by chaekie on 2023/07/19.
//

import SwiftUI

struct HistoryCardView: View {
    var dateString: String
    @Binding var injections: [Injection]
    @Binding var previousSelectedDate: String
    @Binding var previousSelectedPositions: [Int]
    @State private var isNumberSelected = false
    var body: some View {
        VStack {
            let isSelected = previousSelectedDate == dateString
            DateButton(dateString: dateString,
                       isSelected: isSelected,
                       selectDate: changeButtonColor)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach($injections) { $injection in
                        NumberingButton(isSelected: isSelected,
                                        selectDate: changeButtonColor,
                                        injection: injection)
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
    private func changeButtonColor () {
        if previousSelectedDate != dateString {
            previousSelectedDate = dateString
            previousSelectedPositions = injections.map { $0.wrappedPosition }
        }
    }
}

struct DateButton: View {
    var dateString: String
    var isSelected: Bool
    var selectDate: () -> Void
    var body: some View {
        Button {
            selectDate()
        } label: {
            HStack {
                Text(dateString)
                    .font(.headline)
                    .foregroundColor(isSelected ? .white : .accentColor)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(isSelected ? Color.accentColor : Color.mainView7daysBeforeButtonColorUnselected)
                    .cornerRadius(30)
                Spacer()
            }
        }
    }
}

struct NumberingButton: View {
    var isSelected: Bool
    var selectDate: () -> Void
    var injection: Injection
    @State var isCircleSelected = false
    var body: some View {
        Button {
            selectDate()
            print("수정모달 띄우기")
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(isSelected ? .accentColor : .unselectedButtonColor)
                    .frame(width: 60, height: 60)
                Text(String(injection.wrappedPosition))
                    .foregroundColor(isSelected ? .white : .mainView7daysBeforeTextColorUnselected)
                    .font(.headline)
            }
        }
    }
}
//
//struct HistoryCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryCardView(dateString: "2023년 07월 13일",
//                 injections: [InjectionModel(id: UUID().hashValue, timestamp: Date(), position: 1)],
//                 previousSelectedDate: .constant("2023년 07월 13일"),
//                 previousSelectedPositions: .constant([5, 6]))
//        }
//}
