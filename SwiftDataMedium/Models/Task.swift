//
//  Item.swift
//  SwiftDataMedium
//
//  Created by Robert Goedman on 9/16/25.
//

import Foundation
import SwiftData

@Model
class Task {
  var title: String
  var isCompleted: Bool
  var createdAt: Date
  
  var category: Category?  // Inverse relationship
  
  
  init(title: String,
       isCompleted: Bool = false,
       createdAt: Date = Date(),
       category: Category? = nil) {
    self.title = title
    self.isCompleted = isCompleted
    self.createdAt = createdAt
    self.category = category
  }
}

extension Task {
  var longTitle: String {
    if isCompleted == false {
      "Status \(title): Not done"
    } else {
      "Status \(title): Done"
    }
  }
}
