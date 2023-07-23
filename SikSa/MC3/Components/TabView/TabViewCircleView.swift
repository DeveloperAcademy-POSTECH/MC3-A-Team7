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
                    status == Status.under7days ?
                    Color.mainView7daysBeforeButtonStrokeColor :
                        status != Status.recommendation ?
                    Color.mainView7daysAfterButtonStrokeColor :
                        Color.mainViewRecommendationDateButtonStrokeColor
                    , lineWidth: 3)
                .opacity(position == viewModel.pickedPosition ? 1 : 0)
                .frame(width: 66, height: 66)
                .animation(.easeInOut(duration: 0.3) )

            Circle()
                .id(position)
                .onTapGesture {
                    viewModel.pickedPosition = position
                }
                .frame(width: 60, height: 60)
                .foregroundColor(
                    status == Status.recommendation ?
                    Color.mainViewRecommendationDateButtonColor :
                        status != Status.under7days ?
                    Color.mainView7daysAfterButtonColor :
                        viewModel.pickedPosition == position ?
                    Color.mainView7daysBeforeButtonColorSelected :
                        Color.mainView7daysBeforeButtonColorUnselected
                )
                .overlay {
                    Text(String(position))
                        .font(Font.custom("SF Pro Text", size: 19).weight(.bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(
                            status == Status.recommendation ?
                            Color.white :
                                status != Status.under7days ?
                            Color.mainView7daysAfterTextColor :
                                viewModel.pickedPosition == position ?
                            Color.white :
                                Color.mainView7daysBeforeTextColorUnselected
                        )
                }
                .animation(.easeInOut(duration: 0.3))
        }
    }
}

extension TabViewCircleView {
    enum Status {
        case recommendation
        case under7days
        case over7days
    }
}

struct TabViewCircleView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MC3ViewModel()
        TabViewCircleView(viewModel: viewModel, position: 3, status: .recommendation)
    }
}
