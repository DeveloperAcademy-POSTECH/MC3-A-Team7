//
//  Color+.swift
//  SikSa
//
//  Created by sei on 2023/07/20.
//

import SwiftUI

/// 사용 방법
/// viewModel.isNoTabSelected ? Color.disabledButtonColor : Color.activeButtonColor

extension Color {
    static var activeButtonColor: Color { Color(CustomColor.activeButtonColor.rawValue) }
    static var disabledButtonColor: Color { Color(CustomColor.disabledButtonColor.rawValue) }
    static var historyViewSelectedDateButtonColor: Color { Color(CustomColor.historyViewSelectedDateButtonColor.rawValue) }
    static var historyViewSelectedNumberButtonColor: Color { Color(CustomColor.historyViewSelectedNumberButtonColor.rawValue) }
    static var mainView7daysAfterButtonColor: Color { Color(CustomColor.mainView7daysAfterButtonColor.rawValue) }
    static var mainView7daysAfterButtonStrokeColor: Color { Color(CustomColor.mainView7daysAfterButtonStrokeColor.rawValue) }
    static var mainView7daysAfterTextColor: Color { Color(CustomColor.mainView7daysAfterTextColor.rawValue) }
    static var mainView7daysBeforeButtonColorSelected: Color { Color(CustomColor.mainView7daysBeforeButtonColorSelected.rawValue) }
    static var mainView7daysBeforeButtonColorUnselected: Color { Color(CustomColor.mainView7daysBeforeButtonColorUnselected.rawValue) }
    static var mainView7daysBeforeButtonStrokeColor: Color { Color(CustomColor.mainView7daysBeforeButtonStrokeColor.rawValue) }
    static var mainView7daysBeforeTextColorUnselected: Color { Color(CustomColor.mainView7daysBeforeTextColorUnselected.rawValue) }
    static var mainViewRecommendationDateButtonColor: Color { Color(CustomColor.mainViewRecommendationDateButtonColor.rawValue) }
    static var mainViewRecommendationDateButtonStrokeColor: Color { Color(CustomColor.mainViewRecommendationDateButtonStrokeColor.rawValue) }
    static var mainViewTodayAndRecordButtonColor: Color { Color(CustomColor.mainViewTodayAndRecordButtonColor.rawValue) }
    static var mainViewTodayAndRecordTextColor: Color { Color(CustomColor.mainViewTodayAndRecordTextColor.rawValue) }
    static var unselectedButtonColor: Color { Color(CustomColor.unselectedButtonColor.rawValue) }
    static var viewBackgroundBlueColor: Color { Color(CustomColor.viewBackgroundBlueColor.rawValue) }
}
