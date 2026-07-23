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
    
    func addTask(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        tasks.append(TaskItem(title: trimmed))
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
}
