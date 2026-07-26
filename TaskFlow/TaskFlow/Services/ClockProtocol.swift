//
//  ClockProtocol.swift
//  TaskFlow
//
//  Created by Andres De La Cruz on 7/25/26.
//

import Foundation

protocol ClockProtocol { func now() -> Date }

struct RealClock: ClockProtocol { func now() -> Date { Date() } }
