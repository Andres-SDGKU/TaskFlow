//
//  TaskItem.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/20/26.
//

import Foundation

struct TaskItem: Identifiable, Equatable {
    let id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
}
