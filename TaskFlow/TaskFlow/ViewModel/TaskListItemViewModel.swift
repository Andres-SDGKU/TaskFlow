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
    
    // MARK: Class #3 Mocks, DI, Stubs
    private let service: TaskServiceProtocol
    private let notificationScheduler: NotificationSchedulingProtocol
    private let clock: ClockProtocol
    
    init(
        service: TaskServiceProtocol = TaskService(),
        notificationScheduler: NotificationSchedulingProtocol = NotificationScheduler(),
        clock: ClockProtocol = RealClock()
    ) {
        self.service = service
        self.notificationScheduler = notificationScheduler
        self.clock = clock
    }
    
    // Function that calls all the task using the service
    func loadTasks() {
        tasks = service.fetchTasks()
    }
    
    // Function task Overdue
    func isTaskOverdue(_ task: TaskItem) -> Bool {
        task.isOverdue(now: clock.now())
    }
    
    // MARK: Class #1 Functions
    
    func addTask(title: String, priority: Priority = .medium, dueDate: Date? = nil) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        let task = TaskItem(title: trimmed, priority: priority, dueDate: dueDate)
        tasks.append(task)
        if dueDate != nil {
            notificationScheduler.scheduleReminder(for: task)
        }
    }
    
    /// Changed in class #3
    // Remove the task from the list
    func removeTask(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        let removedId = tasks[index].id
        tasks.remove(at: index)
        service.delete(id: removedId)
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
    
    nonisolated deinit {}
}
