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
            RecommendView()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
