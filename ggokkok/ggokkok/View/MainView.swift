//
//  MainView.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.

import SwiftUI
import CoreData

struct MainView: View {
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true

    var body: some View {
        if isFirstLaunching {
            OnboardingView(isFirstLaunching: $isFirstLaunching)
        } else {
            HistoryView()
//            RecommendView()
        }
    }
}

//extension MainView {
//    private enum Views: String, CaseIterable {
//        case onboardingView
//        case recommendView
//        case historyView
//        case editInjectionView
//        case createInjectionView
//        case settingView
//
//        var view: some View {
//            switch self {
//            case .onboardingView:
//                let mainView = MainView()
//                return AnyView(OnboardingView(isFirstLaunching: mainView.$isFirstLaunching,
//                                              viewModel: mainView.onboardingViewModel))
//            case .recommendView:
//                return AnyView(RecommendView())
//            case .historyView:
//                return AnyView(HistoryView())
//            case .editInjectionView:
//                return AnyView(EditInjectionView())
//            case .createInjectionView:
//                return AnyView(CreateInjectionView())
//            case .settingView:
//                return AnyView(SettingView())
//            }
//        }
//    }
//
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
