//
//  ContentView.swift
//  SwiftDataMedium
//
//  Created by Robert Goedman on 9/16/25.
//

import SwiftUI
import SwiftData

struct ContentView {
  @State private var isAddTaskVisible: Bool = false
  @State private var isLiquidGlassVisible: Bool = false
  @Environment(\.modelContext) private var modelContext
  @Query private var tasks: [Task]
}

extension ContentView {
  private var sortedTasks: [Task] {
    tasks.sorted { $0.createdAt < $1.createdAt }
  }
}

extension ContentView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(sortedTasks) { task in
          VStack {
            NavigationLink(task.longTitle,
                           value: task)
          }
        }
        .onDelete(perform: deleteTasks)
      }
      Button("Liquid Glass") {
          isLiquidGlassVisible = true
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
        ToolbarItem {
          Button { isAddTaskVisible = true }
          label:{
            Label("Add Item", systemImage: "plus")
          }
        }
      }
      .navigationDestination(for: Task.self) { task in
        UpdateTaskView(task: task)
      }
      .sheet(isPresented: $isLiquidGlassVisible) {
        LiquidGlass(isLiquidGlassVisible: $isLiquidGlassVisible)
      }
      .sheet(isPresented: $isAddTaskVisible) {
        AddTaskView(isAddTaskVisible: .constant(true))
      }
    }
  }
}

extension ContentView {
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
