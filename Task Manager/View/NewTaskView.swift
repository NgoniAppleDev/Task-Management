//
//  NewTaskView.swift
//  Task Manager
//
//  Created by Ngoni Katsidzira  on 11/4/2025.
//

import SwiftUI

struct NewTaskView: View {
    /// View Properties
    @Environment(\.dismiss) var dismiss
    /// Model Context For Saving Data
    @Environment(\.modelContext) var context
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    @State private var taskColor: String = "TaskColor 1"
    
    init(currentDate: Binding<Date>) {
        self._taskDate = State(wrappedValue: currentDate.wrappedValue)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            }
            .hSpacing(.leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Task Title")
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                TextField("Go for a Walk!", text: $taskTitle)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 15)
                    .background(Color(.systemBackground).shadow(.drop(color: Color(.label).opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
            }
            .padding(.top, 5)
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    DatePicker("", selection: $taskDate)
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                }
                /// Giving Some Space for tapping
                .padding(.trailing, -15)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Color")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    let colors: [String] = (1...5).compactMap { index -> String in
                        return "TaskColor \(index)"
                    }
                    
                    HStack(spacing: 0) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(Color(color))
                                .frame(width: 20, height: 20)
                                .background {
                                    Circle()
                                        .stroke(lineWidth: 5)
                                        .opacity(taskColor == color ? 1 : 0)
                                }
                                .hSpacing(.center)
                                .contentShape(.rect)
                                .onTapGesture {
                                    withAnimation(.snappy) {
                                        taskColor = color
                                    }
                                }
                        }
                    }
                }
            }
            .padding(.top, 5)
            
            Spacer(minLength: 0)
            
            Button {
                /// Saving Task
                let task = Task(taskTitle: taskTitle, creationDate: taskDate, tint: taskColor)
                do {
                    context.insert(task)
                    try context.save()
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            } label: {
                Text("Create Task")
                    .font(.title3.weight(.semibold))
                    .textScale(.secondary)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(Color(taskColor), in: .rect(cornerRadius: 10))
                    .foregroundStyle(Color(.label))
            }
            .disabled(taskTitle.trimmingCharacters(in: .whitespaces).isEmpty)
            .opacity(taskTitle.trimmingCharacters(in: .whitespaces).isEmpty ? 0.5 : 1)
        }
        .padding(15)
    }
}

#Preview {
    NewTaskView(currentDate: .constant(.init()))
        .vSpacing(.bottom)
}






