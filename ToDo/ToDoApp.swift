//
//  ToDoApp.swift
//  ToDo
//
//  Created by 汤子晏 on 2024/10/1.
//

import SwiftUI

@main
struct ToDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
