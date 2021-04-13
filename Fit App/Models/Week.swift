//  Week.swift

import Foundation

class Week {
    //var days = [Day](repeating: Day(), count: 7)
    var sunday = Day()
    var monday = Day()
    var tuesday = Day()
    var wednesday = Day()
    var thursday = Day()
    var friday = Day()
    var saturday = Day()
    
    //test
    init() {
        self.monday.activities = [Activity(in: Gym(imageName: "gym1",
                                                    title: "Gimnasio Taurus",
                                                    address: "Paraguay 2450, Buenos Aires 1121",
                                                    openTime: "9:00",
                                                    closeTime: "22:00",
                                                    proximity: 450,
                                                    isOpen: true),
                                            startAt: "9:00",
                                            endAt: "10:30",
                                            at: "Sala de pesas",
                                            type: .Gym),
                                   Activity(in: Gym(imageName: "gym1",
                                                    title: "Gimnasio Taurus",
                                                    address: "Paraguay 2450, Buenos Aires 1121",
                                                    openTime: "9:00",
                                                    closeTime: "22:00",
                                                    proximity: 450,
                                                    isOpen: true),
                                            startAt: "17:00",
                                            endAt: "17:45",
                                            at: "Aquagym",
                                            type: .Pool)]
        
        self.wednesday.activities = [Activity(in: Gym(imageName: "gym1",
                                                      title: "Gimnasio Taurus",
                                                      address: "Paraguay 2450, Buenos Aires 1121",
                                                      openTime: "9:00",
                                                      closeTime: "22:00",
                                                      proximity: 450,
                                                      isOpen: true),
                                              startAt: "9:00",
                                              endAt: "10:30",
                                              at: "Sala de pesas",
                                              type: .Gym)]
    }
}
