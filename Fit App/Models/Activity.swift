//
//  Activity.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 13/04/2021.
//

import Foundation

enum ActivityType {
    case Gym
    case Pool
    case Lesson
}

class Activity {
    let id = UUID()
    let gym: Gym
    let startTime: String
    let endTime: String
    let place: String
    let type: ActivityType
    
    init(in gym: Gym, startAt startTime: String, endAt endTime: String, at place: String, type: ActivityType) {
        self.gym = gym
        self.startTime = startTime
        self.endTime = endTime
        self.place = place
        self.type = type
    }
}


