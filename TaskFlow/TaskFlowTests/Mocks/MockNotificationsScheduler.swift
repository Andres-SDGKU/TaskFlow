//
//  MockNoficationsScheduler.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/25/26.
//

import Foundation
@testable import TaskFlow

class MockNotificationsScheduler: NotificationSchedulingProtocol {
    var scheduleCallCount = 0
    var lastScheduleTask: TaskItem?
    func scheduleReminder(for task: TaskItem) {
        scheduleCallCount += 1
        lastScheduleTask = task
    }
}
