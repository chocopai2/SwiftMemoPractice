//
//  SwiftMemoApp.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import SwiftUI

@main
struct SwiftMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
