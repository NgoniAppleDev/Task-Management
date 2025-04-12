//
//  Task.swift
//  Task Manager
//
//  Created by Ngoni Katsidzira  on 10/4/2025.
//

import SwiftData
import SwiftUI

@Model
class Task: Identifiable {
    var id: UUID = UUID()
    var taskTitle: String
    var creationDate: Date
    var isCompleted: Bool
    var tint: String
    
    init(id: UUID = .init(), taskTitle: String, creationDate: Date = .init(), isCompleted: Bool = false, tint: String) {
        self.id = id
        self.taskTitle = taskTitle
        self.creationDate = creationDate
        self.isCompleted = isCompleted
        self.tint = tint
    }
    
    var tintColor: Color {
        switch tint {
        case "TaskColor 1": .taskColor1
        case "TaskColor 2": .taskColor2
        case "TaskColor 3": .taskColor3
        case "TaskColor 4": .taskColor4
        case "TaskColor 5": .taskColor5
        default: .taskColor1
        }
    }
}

//var sampleTasks: [Task] = [
//    .init(taskTitle: "Record Video", creationDate: .updateHour(-5), isCompleted: true, tint: .taskColor1),
//    .init(taskTitle: "Redesign Website", creationDate: .updateHour(-3), tint: .taskColor2),
//    .init(taskTitle: "Go for a Walk", creationDate: .updateHour(-4), tint: .taskColor3),
//    .init(taskTitle: "Edit Video", creationDate: .updateHour(0), isCompleted: true, tint: .taskColor4),
//    .init(taskTitle: "Publish Video", creationDate: .updateHour(2), isCompleted: true, tint: .taskColor1),
//    .init(taskTitle: "Tweet about new Video!", creationDate: .updateHour(1), tint: .taskColor5),
//]

extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}





