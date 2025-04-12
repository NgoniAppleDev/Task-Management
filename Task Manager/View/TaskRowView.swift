//
//  TaskRowView.swift
//  Task Manager
//
//  Created by Ngoni Katsidzira  on 11/4/2025.
//

import SwiftUI

struct TaskRowView: View {
    @Bindable var task: Task
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Circle()
                .fill(indicatorColor)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(Color.headerViewBG.shadow(.drop(color: Color(.label).opacity(0.1), radius: 3)), in: .circle)
                .overlay {
                    /// To make the button tap more accessible,
                    /// I'm adding an invisible layer to receive the taps.
                    Circle()
                        .frame(width: 50, height: 50)
                        .blendMode(.destinationOver)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                task.isCompleted.toggle()
                            }
                        }
                }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(task.taskTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.label).opacity(0.75))
                
                Label(task.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(Color(.label))
            }
            .padding(15)
            .hSpacing(.leading)
            .background(task.tintColor, in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(task.isCompleted, pattern: .solid, color: Color(.label))
            .offset(y: -8)
        }
    }
    
    var indicatorColor: Color {
        if task.isCompleted {
            return .green
        }
        
        return task.creationDate.isSameHour
        ? .darkBlue
        : (task.creationDate.isPast ? .red : Color(.label))
    }
}

#Preview {
    ContentView()
}













