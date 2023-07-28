//
//  GgokKokApp.swift
//  GgokKok
//
//  Created by sei on 2023/07/28.
//

import SwiftUI

@main
struct GgokKokApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
