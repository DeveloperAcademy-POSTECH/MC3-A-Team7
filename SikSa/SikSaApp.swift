//
//  SikSaApp.swift
//  SikSa
//
//  Created by chaekie on 2023/07/10.
//

import SwiftUI

@main
struct SikSaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
