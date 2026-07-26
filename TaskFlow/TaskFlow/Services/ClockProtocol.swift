//
//  ClockProtocol.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/25/26.
//

import Foundation

protocol ClockProtocol: AnyObject {
    func now() -> Date
}

class RealClock: ClockProtocol {
    func now() -> Date { Date() }
}
