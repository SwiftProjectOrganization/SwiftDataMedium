//
//  AddTaskView.swift
//  SwiftDataMedium
//
//  Created by Robert Goedman on 9/16/25.
//

import Foundation
import SwiftUI
import SwiftData

struct UpdateTaskView {
  @State private var newTitle: String = ""
  @State private var newIsCompleted: Bool = false
  @State private var newCreatedAt: Date = Date()
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var context
  @Environment(\.modelContext) private var modelContext
  var task : Task
}

extension UpdateTaskView: View {
    var body: some View {
      VStack {
        Text("Update a task")
          .font(Font.largeTitle.bold())
          .foregroundStyle(Color.blue)
          .multilineTextAlignment(.center)
      }
      Spacer()
      VStack {
        HStack {
          Spacer()
          TextField("Title", text: $newTitle, axis: .vertical)
             .font(.largeTitle)
            .padding()
            .multilineTextAlignment(.leading)
            .textFieldStyle(.roundedBorder)
            .border(Color.red,
                    width: 3)
          Spacer()
        }
        HStack {
          Spacer()
          Toggle("Completed", isOn: $newIsCompleted)
            .padding(.horizontal)
          Spacer()
        }
        HStack {
          Text("     Date: \(formatDate(newCreatedAt))")
          Spacer()
        }
      }
      Spacer()
      VStack {
        Button("Save task") {
          updateTask()
        }
      }
      .onAppear {
        newTitle = task.title
        newIsCompleted = task.isCompleted
        newCreatedAt = task.createdAt
      }
    }
}

extension UpdateTaskView {
  private func updateTask() {
      withAnimation {
        task.title = newTitle
        task.isCompleted = newIsCompleted
        do {
          try context.save()
          print("Task \(task.title) updated")
        } catch {
          print(error.localizedDescription)
        }
        dismiss()
      }
  }
  
}

#Preview {
  UpdateTaskView(task: Task(title: "Preview task",
                           isCompleted: true,
                            createdAt: Date()))
}
