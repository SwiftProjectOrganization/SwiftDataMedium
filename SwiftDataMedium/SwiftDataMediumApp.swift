//
//  SwiftDataMediumApp.swift
//  SwiftDataMedium
//
//  Created by Robert Goedman on 9/16/25.
//

import SwiftUI
import SwiftData
import CloudKit

import SwiftUI
import SwiftData

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
