//
//  FakeClock.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/25/26.
//

import Foundation
@testable import TaskFlow

class FakeClock: ClockProtocol {
    var fixedDate: Date
    init(fixedDate: Date) { self.fixedDate = fixedDate }
    func now() -> Date { fixedDate }
}
