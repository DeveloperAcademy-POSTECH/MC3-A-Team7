//
//  InjectionSitesView.swift
//  SikSa
//
//  Created by chaekie on 2023/07/19.
//

import SwiftUI

struct InjectionSitesView: View {
    var previousSelectedPositions: [Int]
    var body: some View {
        HStack {
            VStack {
                HStack(spacing: 4) {
                    ForEach(1..<5) {
                        NumberingColumn(columnOrder: $0,
                                        previousSelectedPositions: previousSelectedPositions)
                    }
                    VStack {
                        VStack(spacing: 0) {
                            Text("배")
                            Circle()
                                .strokeBorder(lineWidth: 3)
                                .foregroundColor(Color(.systemGray5))
                                .blur(radius: 0.5)
                                .frame(width: 25, height: 25)
                                .padding(.bottom, 2)
                            Text("꼽")
                        }
                        .font(.system(size: 10))
                    }
                    .offset(y: -33)
                    .foregroundColor(Color(.systemGray2))
                    ForEach(5..<9) {
                        NumberingColumn(columnOrder: $0,
                                        previousSelectedPositions: previousSelectedPositions)
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(12)
        .overlay(
            Text("아래")
                .font(.system(size: 9))
                .padding(.top)
                .foregroundColor(Color(.systemGray2))
            , alignment: .top
        )
        .overlay(
            Text("위")
                .font(.system(size: 9))
                .padding(.bottom)
                .foregroundColor(Color(.systemGray2))
            , alignment: .bottom
        )
    }
}

struct NumberingColumn: View {
    var columnOrder: Int
    var previousSelectedPositions: [Int]
    var body: some View {
        VStack(spacing: 4) {
            ForEach(0..<4) {
                NumberingCircle(number: 8 * $0 + columnOrder,
                                previousSelectedPositions: previousSelectedPositions)
            }
        }
    }
}

struct NumberingCircle: View {
    var number: Int
    var previousSelectedPositions: [Int]
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(previousSelectedPositions.contains(number) ? .accentColor : .mainView7daysBeforeButtonColorUnselected)
            Text(String(number))
                .font(.caption2)
                .foregroundColor(previousSelectedPositions.contains(number) ? .white : .mainView7daysBeforeTextColorUnselected)
        }
    }
}

//struct InjectionSitesView_Previews: PreviewProvider {
//    static var previews: some View {
//        InjectionSitesView(previousSelectedPositions: [1, 2, 3])
//    }
//}
