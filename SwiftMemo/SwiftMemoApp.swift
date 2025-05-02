//
//  SwiftMemoApp.swift
//  SwiftMemo
//
//  Created by wangjun on 5/2/25.
//

import SwiftUI

@main
struct SwiftMemoApp: App {
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
