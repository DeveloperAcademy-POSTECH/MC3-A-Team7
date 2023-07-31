//
//  SettingView.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import SwiftUI

struct SettingItem: Hashable {
    let id = UUID()
    let name: String
//    let destination: (_ viewModel: RecommendationExclusionViewModel) -> AnyView
}

struct SettingCategory: Identifiable {
    var id = UUID()
    let title: String
    let settingItems: [SettingItem]

    init(title: String, settingItems: [SettingItem]) {
        self.title = title
        self.settingItems = settingItems
    }
}

enum InjectionSiteItems: CaseIterable {
    case lastSiteNumber
    case recommendationExclusion

    var name: String {
        switch self {
        case .lastSiteNumber: return "주사부위표 마지막 번호"
        case .recommendationExclusion: return "추천 제외 부위"
        }
    }

//    func destination(_ viewModel: RecommendationExclusionViewModel) -> AnyView {
//        switch self {
//        case .lastSiteNumber:
//            return AnyView(OnboardingView(isFirstLaunching: .constant(true)))
//        case .recommendationExclusion:
//            return AnyView(RecommendationExclusionView(viewModel: viewModel))
//        }
//    }

}

let injectionSiteItems: [SettingItem] = InjectionSiteItems.allCases.map { SettingItem(name: $0.name
//                                                                                      , destination: $0.destination()
) }

enum SettingCategories: CaseIterable, Identifiable {
    case injectionSite

    var id: String {
        switch self {
            case .injectionSite: return "injectionSite"
        }
    }

    var title: String {
        switch self {
        case .injectionSite: return "주사부위표"
        }
    }

    var settingItems: [SettingItem] {
        switch self {
        case .injectionSite: return injectionSiteItems
        }
    }
}



struct SettingView: View {
    static let lastSiteNumber = UserDefaults.standard.integer(forKey: UserDefaultsKey.lastSiteNumber.rawValue)
    @StateObject var viewModel = RecommendationExclusionViewModel(lastSiteNumber: Self.lastSiteNumber)
    let settingCategories: [SettingCategory] = SettingCategories.allCases.map { SettingCategory(title: $0.title, settingItems: $0.settingItems) }
    @State private var singleSelection: UUID?

    var body: some View {
        List(selection: $singleSelection) {
            ForEach(settingCategories) { settingCategory in
                Section(header: Text("\(settingCategory.title)")) {
                    ForEach(settingCategory.settingItems, id: \.self) { settingItem in
//                        NavigationLink(destination: settingItem.destination(viewModel)) {
                        NavigationLink(destination: getDestination(from: settingItem.name)) {
                            Text(settingItem.name)
                        }
                    }
                }
            }
        }
    }

    func getDestination(from name: String) -> AnyView {
        switch name {
        case "주사부위표 마지막 번호":
            return AnyView(OnboardingView(isFirstLaunching: .constant(true)))
        case "추천 제외 부위":
            return AnyView(RecommendationExclusionView(viewModel: viewModel))
        default:
            return AnyView(SettingView())
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
