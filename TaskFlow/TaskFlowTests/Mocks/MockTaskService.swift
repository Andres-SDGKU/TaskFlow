//
//  MockTaskService.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/25/26.
//

import Foundation
@testable import TaskFlow

class MockTaskService: TaskServiceProtocol {
    var deleteCallCount = 0
    private var tasksToReturn: [TaskItem]
    init(tasksToReturn: [TaskItem] = []) { self.tasksToReturn = tasksToReturn}
    func fetchTasks() -> [TaskItem] { tasksToReturn }
    func delete(id: UUID) { deleteCallCount += 1 }
}
