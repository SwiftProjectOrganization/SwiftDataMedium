//
//  TaskRepository.swift
//  SwiftDataMedium
//
//  Created by Robert Goedman on 9/16/25.
//

import Foundation
import SwiftData

//actor TaskRepository {
//    private let context: ModelContext
//    
//    init(context: ModelContext) {
//        self.context = context
//    }
//    
//    func addTask(title: String) async throws {
//        let task = Task(title: title)
//        context.insert(task)
//        try context.save()
//    }
//    
//    func fetchTasks() async throws -> [Task] {
//        let descriptor = FetchDescriptor<Task>(
//            sortBy: [SortDescriptor(\.createdAt)]
//        )
//        return try context.fetch(descriptor)
//    }
//    
//    func deleteTask(_ task: Task) async throws {
//        context.delete(task)
//        try context.save()
//    }
//}
//
//@MainActor
//func refreshTasks(repository: TaskRepository) async {
//    if let tasks = try? await repository.fetchTasks() {
//        print("Loaded \(tasks.count) tasks")
//    }
//}
//
//Task.detached {
//    let backgroundContext = ModelContext(container)
//    let repo = TaskRepository(context: backgroundContext)
//    
//    for i in 0..<500 {
//        try await repo.addTask(title: "Imported \(i)")
//    }
//}
//
//@globalActor
//actor TaskCacheActor {
//    static let shared = TaskCacheActor()
//}
//
//@TaskCacheActor
//final class TaskCache {
//    private var cachedTasks: [Task] = []
//    
//    func update(tasks: [Task]) {
//        cachedTasks = tasks
//    }
//    
//    func getTasks() -> [Task] {
//        cachedTasks
//    }
//}
//
////Usage:
//
//let cache = TaskCache()
//
//Task {
//    let tasks = try await repository.fetchTasks()
//    await cache.update(tasks: tasks)
//}
//
//Task {
//    let cached = await cache.getTasks()
//    print("Cached count: \(cached.count)")
//}
////Here’s how we can build a TaskSyncManager that ensures thread safety using an actor.
//
//actor TaskSyncManager {
//    private let repository: TaskRepository
//    private let api: TaskAPI
//    
//    init(repository: TaskRepository, api: TaskAPI) {
//        self.repository = repository
//        self.api = api
//    }
//    
//    func sync() async throws {
//        // 1. Fetch tasks from server
//        let remoteTasks = try await api.fetchTasks()
//        
//        // 2. Save to SwiftData
//        for task in remoteTasks {
//            try await repository.addTask(title: task.title)
//        }
//    }
//}
//
//// Then in a SwiftUI view:
//
//struct SyncButtonView: View {
//    let syncManager: TaskSyncManager
//    
//    var body: some View {
//        Button("Sync Now") {
//            Task {
//                try? await syncManager.sync()
//            }
//        }
//        .buttonStyle(.borderedProminent)
//    }
//}
