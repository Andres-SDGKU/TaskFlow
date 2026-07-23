//
//  TaskListViewModel.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/20/26.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []
    
    // MARK: Class #1 Functions
    
    func addTask(title: String, priority: Priority = .medium) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        tasks.append(TaskItem(title: trimmed, priority: priority))
    }
    
    // Remove the task from the list
    func removeTask(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        tasks.remove(at: index)
    }
    
    // Toggles the completion of the state
    func toggleCompletion(id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[index].isCompleted.toggle()
    }
    
    // Returns how many task are completed
    var completedCount: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    // MARK: Class #2 Functions
    
    // Filter by priority
    func tasks(for priority: Priority) -> [TaskItem] {
        tasks.filter { $0.priority == priority }
    }
    
    // Sort by priority
    var tasksSortedByPriority: [TaskItem] {
        let order: [Priority] = [.high, .medium, .low]
        return tasks.sorted {
            guard let i = order.firstIndex(of: $0.priority),
                    let j = order.firstIndex(of: $1.priority)
            else { return false }
            return i < j
        }
    }
}
