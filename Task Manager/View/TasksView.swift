//
//  TasksView.swift
//  Task Manager
//
//  Created by Ngoni Katsidzira  on 11/4/2025.
//

import SwiftData
import SwiftUI

struct TasksView: View {
    @Binding var currentDate: Date
    
    /// Swift Data Dynamic Query
    @Query private var tasks: [Task]
    
    init(currentDate: Binding<Date>) {
        self._currentDate = currentDate
        
        /// Predicate
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Task> {
            return $0.creationDate >= startOfDate && $0.creationDate < endOfDate
        }
        
        /// Sorting
        let sortDescriptor = [
            SortDescriptor(\Task.creationDate, order: .forward)
        ]
        self._tasks = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach(tasks) { task in
                TaskRowView(task: task)
                    .background(alignment: .leading) {
                        if tasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
        .overlay {
            if tasks.isEmpty {
                ContentUnavailableView {
                    Label("No Tasks Found", systemImage: "checklist")
                }
                .frame(width: 300, height: 300)
                .padding(.top, 200)
            }
        }
    }
}

#Preview {
    ContentView()
}



