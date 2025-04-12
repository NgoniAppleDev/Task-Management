//
//  Task_ManagerApp.swift
//  Task Manager
//
//  Created by Ngoni Katsidzira  on 10/4/2025.
//

import SwiftUI
import SwiftUI

@main
struct Task_ManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
