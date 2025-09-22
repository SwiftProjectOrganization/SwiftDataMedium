//
//  Category.swift
//  SwiftDataMedium
//
//  Created by Robert Goedman on 9/16/25.
//

import Foundation
import SwiftData

@Model
class Category {
  var name: String
  var type: CategoryEnum
  
  var tasks: [Task] = []   // One category can have many tasks
  
  init(name: String,
       type: CategoryEnum = .shortTerm) {
    self.name = name
    self.type = type
  }
}
