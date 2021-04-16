//  Shift.swift

import Foundation

struct Shift: Identifiable {
    let id = UUID()
    let place: String
    let type: ActivityType
    let startTime: String
    let endTime: String
    let maxCapacity: Int
    
}
