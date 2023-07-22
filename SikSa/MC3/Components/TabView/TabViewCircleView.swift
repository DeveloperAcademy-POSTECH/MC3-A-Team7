//
//  CircleView.swift
//  SikSa
//
//  Created by sei on 2023/07/19.
//

import SwiftUI

struct TabViewCircleView: View {
    @ObservedObject var viewModel: MC3ViewModel
    var position: Int
    var status: Status

    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color(hex: status.strokeColor),
                    lineWidth: 3)
                .opacity(position == viewModel.pickedPosition ? 1 : 0)
                .frame(width: 66, height: 66)

            Circle()
                .id(position)
                .onTapGesture {
                    viewModel.pickedPosition = position
                }
                .frame(width: 60, height: 60)
                .foregroundColor(
                    Color(hex: status.backgroundColor))
                .overlay {
                    Text(String(position))
                        .font(Font.custom("SF Pro Text", size: 19))
                        .multilineTextAlignment(.center)
                        .foregroundColor(
                            Color(hex: status.textColor)
                        )
                }
        }
    }
}

extension TabViewCircleView {
    enum Status {
        case recommendation
        case under7days
        case over7days

        var backgroundColor: String {
            switch self {
            case .recommendation:
                return "0055B1"
            case .under7days:
                return "000000"
            case .over7days:
                return "E8E8EA"
            }
        }

        var strokeColor: String {
            switch self {
            case .recommendation:
                return "326BFF"
            case .under7days:
                return "B3B3BF"
            case .over7days:
                return "A8C5FF"
            }
        }

        var textColor: String {
            switch self {
            case .recommendation:
                return "D2D2D6"
            case .under7days:
                return "ABA1A1"
            case .over7days:
                return "326BFF"
            }
        }
    }
}

struct TabViewCircleView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MC3ViewModel()

        TabViewCircleView(viewModel: viewModel, position: 3, status: .recommendation)
    }
}
