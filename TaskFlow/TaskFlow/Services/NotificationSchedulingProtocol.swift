//
//  NotificationSchedulingProtocol.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/25/26.
//

protocol NotificationSchedulingProtocol {
    func scheduleReminder(for task: TaskItem)
}

class NotificationScheduler: NotificationSchedulingProtocol {
    func scheduleReminder(for task: TaskItem) {
        // real UNUserNotificationCenter call goes here
    }
}
