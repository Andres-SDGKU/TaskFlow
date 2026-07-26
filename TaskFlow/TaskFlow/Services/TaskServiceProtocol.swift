//
//  TaskServiceProtocol.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/25/26.
//

import Foundation

protocol TaskServiceProtocol: AnyObject {
    func fetchTasks() -> [TaskItem]
    func delete(id: UUID)
}

class TaskService: TaskServiceProtocol {
    func fetchTasks() -> [TaskItem] { [] }
    func delete(id: UUID) {
           // simula el delete real en el backend
       }
}

class StubTaskService: TaskServiceProtocol {
    private let stubbedTasks: [TaskItem]
    init(stubbedTasks: [TaskItem] = [
        TaskItem(title: "A", priority: .medium),
        TaskItem(title: "B", priority: .medium),
        TaskItem(title: "C", priority: .medium)
    ]) { self.stubbedTasks = stubbedTasks }
    func fetchTasks() -> [TaskItem] { stubbedTasks }
    func delete(id: UUID) {
        // Simulates the real delete in backend
    }
}
