//  DateExtensions.swift

import Foundation

extension Date {
    func dayNumberOfTheWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
