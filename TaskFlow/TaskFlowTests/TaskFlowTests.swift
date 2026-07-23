//
//  TaskFlowTests.swift
//  TaskFlowTests
//
//  Created by Andres De La Cruz on 7/20/26.
//

import XCTest
@testable import TaskFlow

final class TaskFlowTests: XCTestCase {
    
    var viewModel: TaskListViewModel!
    
    override func setUpWithError() throws {
       viewModel = TaskListViewModel()
    }

    override func tearDownWithError() throws {
        // viewModel = nil
    }
    
    // MARK: Class #1
    func test_addTask_increasesCount() {
        // Arrange - viewModel already empty thanks to setUp
       
        
        // Act
        viewModel.addTask(title: "Buy milk")
        
        // Assert
        XCTAssertEqual(viewModel.tasks.count, 1)
    }
    
    func test_addTask_increasesCount10() {
        // Arrange - ViewModel already
        
        
        // Act
        viewModel.addTask(title: "Buy Coffee")
        viewModel.addTask(title: "Buy Coffee")
        viewModel.addTask(title: "Buy Coffee")
        viewModel.addTask(title: "Buy Coffee")
        viewModel.addTask(title: "Buy Coffee")
        viewModel.addTask(title: "Buy Coffee")
        viewModel.addTask(title: "Buy Coffee")
        viewModel.addTask(title: "Buy Coffee")
        viewModel.addTask(title: "Buy Coffee")
        viewModel.addTask(title: "Buy Coffee")
        
        // Assert
        XCTAssertEqual(viewModel.tasks.count, 10)
    }
    
    /// Add 2 task - then remove one  - verify if the second one remains
    func test_removeTask_removeCorrectItem() {
        // Arrange
        viewModel.addTask(title: "Task A")
        viewModel.addTask(title: "Task B")
        
        // Act
        viewModel.removeTask(at: 0)
        
        // Assert
        XCTAssertEqual(viewModel.tasks.count, 1)
        XCTAssertEqual(viewModel.tasks.first?.title, "Task B")
    }
    
    /// Toggle a task - Verify if is true
    func test_toggleCompletion_flipsIsCompleted() {
        // Arrange
        viewModel.addTask(title: "Task A")
        let taskId = viewModel.tasks[0].id
        XCTAssertFalse(viewModel.tasks[0].isCompleted)
        
        // Act
        viewModel.toggleCompletion(id: taskId)
        
        // Assert
        XCTAssertTrue(viewModel.tasks[0].isCompleted)
    }
    
    /// Test task with empty title
    func test_addTask_withEmptyTitle_isIgnored() {
        // Arrange
        let initialCount = viewModel.tasks.count
        
        // Act
        viewModel.addTask(title: "    ")
        
        // Assert
        XCTAssertEqual(viewModel.tasks.count, initialCount, "Empty/Whitespaces titles should not create a task")
    }
    
    // MARK: Class #2
    
    
    /// UI Test
    func test_addTask_UI() {
        // Arrange
        let app = XCUIApplication()
        app.launch()
        
        // Act
        app.textFields["New task..."].typeText("Milk")
        app.buttons["Add"].tap()
        
        // Assert
        XCTAssert(app.staticTexts["Mik"].exists)
    }
    
    /// TDD priority test
    func test_addTask_defaultPriorityIsMedium(){
        // Arrange
        
        // Act
        viewModel.addTask(title: "Task A")
        
        // Assert
        XCTAssertEqual(viewModel.tasks[0].priority, .medium)
    }
    
    /// TDD High priority store test
    func test_addTask_withHighPriority_storesPriority() {
        // Arrange
        
        // Act
        viewModel.addTask(title: "Urgent", priority: .high)
        
        // Assert
        XCTAssertEqual(viewModel.tasks[0].priority, .high)
    }
    
    /// TDD Test task with priority returns only matching
    func test_task_forPriority_returnsOnlyMatchingTask() {
        // Arrange
        viewModel.addTask(title: "Low", priority: .low)
        viewModel.addTask(title: "High 1", priority: .high)
        viewModel.addTask(title: "High 2", priority: .high)
        
        // Act
        let highTasks = viewModel.tasks(for: .high)
        
        // Assert
        XCTAssertEqual(highTasks.count, 2)
        XCTAssertTrue(highTasks.allSatisfy { $0.priority == .high })
    }
    
    /// TDD Test task sorted by priority high first
    func test_taskSortedByPriority_returnHighFirst() {
        // Arrange
        viewModel.addTask(title: "Low", priority: .low)
        viewModel.addTask(title: "Medium", priority: .medium)
        viewModel.addTask(title: "High", priority: .high)
        
        // Act
        let sorted = viewModel.tasksSortedByPriority
        
        // Assert
        XCTAssertEqual(sorted[0].priority, .high)
        XCTAssertEqual(sorted[1].priority, .medium)
        XCTAssertEqual(sorted[2].priority, .low)
    }
 }
