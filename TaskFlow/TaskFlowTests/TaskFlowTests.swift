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
    
 }
