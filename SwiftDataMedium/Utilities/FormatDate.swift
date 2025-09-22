//
//  FormatDate.swift
//  SwiftDataMedium
//
//  Created by Robert Goedman on 9/16/25.
//

import Foundation

func formatDate(_ date: Date) -> String {
  let formatter = DateFormatter()
  formatter.dateFormat = "MM/dd/yyyy HH:mm"
  return formatter.string(from: date)
}
