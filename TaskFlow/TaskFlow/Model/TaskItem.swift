//
//  TaskItem.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/20/26.
//

import Foundation

enum Priority: String, CaseIterable {
    case low, medium, high
}

struct TaskItem: Identifiable, Equatable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var priority: Priority
}
