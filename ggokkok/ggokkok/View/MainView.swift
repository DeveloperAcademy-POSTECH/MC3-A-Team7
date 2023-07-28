//
//  MainView.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import SwiftUI
import CoreData

struct MainView: View {
    var body: some View {
        TabView{
            ForEach(Views.allCases, id: \.self) { view in
                view.view
                    .tabItem {
                        Image("circle")
                        Text(view.rawValue.prefix(3))
                    }
            }
        }
    }
}

extension MainView {
    private enum Views: String, CaseIterable {
//        case coredataExampleView
        case recommendView
        case historyView
        case editInjectionView
        case createInjectionView
        case settingView

        var view: some View {
            switch self {
//            case .coredataExampleView:
//                return AnyView(CoredataExampleView())
            case .recommendView:
                return AnyView(RecommendView())
            case .historyView:
                return AnyView(HistoryView())
            case .editInjectionView:
                return AnyView(EditInjectionView())
            case .createInjectionView:
                return AnyView(CreateInjectionView())
            case .settingView:
                return AnyView(SettingView())
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

