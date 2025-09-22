//
//  AddTaskView.swift
//  SwiftDataMedium
//
//  Created by Robert Goedman on 9/16/25.
//

import Foundation
import SwiftUI
import SwiftData

struct AddTaskView {
  @Binding var isAddTaskVisible: Bool
  @State private var newTaskTitle: String = ""
  @State private var newTaskIsCompleted: Bool = false
  @State private var newTaskCreatedAt: Date = Date()
  @State private var newCategory: Category = Category(type: .shortTerm)
  @Environment(\.scenePhase) private var scenePhase
  @FocusState private var focusField
  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var modelContext
  @Query private var tasks: [Task]
}

extension AddTaskView: View {
    var body: some View {
      VStack {
        Text("Add a new task")
          .font(Font.largeTitle.bold())
          .foregroundStyle(Color.blue)
          .multilineTextAlignment(.center)
      }
      Spacer()
      VStack {
        HStack {
          Spacer()
          TextField("Topic title", text: $newTaskTitle, axis: .vertical)
            .focused($focusField)
            .font(.largeTitle)
            .padding()
            .multilineTextAlignment(.leading)
            .textFieldStyle(.roundedBorder)
            .border(Color.red,
                    width: 3)
          Spacer()
        }
        HStack {
          Text("      Category: \(newCategory.type.rawValue)")
            .multilineTextAlignment(.trailing)
          Spacer()
        }
        HStack {
          Spacer()
          Toggle("Active in recall", isOn: $newTaskIsCompleted)
            .padding(.horizontal)
          Spacer()
        }
        HStack {
          Text("      Date: \(formatDate(newTaskCreatedAt))")
          Spacer()
        }

      }
      Spacer()
      VStack {
        Button("Add task") {
          addTask()
        }
      }
    }
}

extension AddTaskView {
  private func addTask() {
      withAnimation {
        let newTask = Task(title: newTaskTitle,
                           isCompleted: newTaskIsCompleted,
                           createdAt: newTaskCreatedAt,
                           category: )
        modelContext.insert(newTask)
        isAddTaskVisible = false
        dismiss()
      }
  }
  
}

#Preview {
  AddTaskView(isAddTaskVisible: .constant(true))
}
