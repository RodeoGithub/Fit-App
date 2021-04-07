//  Gym.swift

import Foundation

class Gym: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let address: String
    let openTime: String
    let closeTime: String
    let proximity: Int // en metros
    let condition: Bool
    
    init(imageName: String,
         title: String,
         address: String,
         openTime: String,
         closeTime: String,
         proximity: Int,
         isOpen condition: Bool) {
        self.imageName = imageName
        self.address = address
        self.title = title
        self.openTime = openTime
        self.closeTime = closeTime
        self.proximity = proximity
        self.condition = condition
    }
}

let gymTestList = [
    Gym(imageName: "gym1",
        title: "Gimnasio Taurus",
        address: "Paraguay 2450, Buenos Aires 1121",
        openTime: "9:00",
        closeTime: "22:00",
        proximity: 450,
        isOpen: true),
    Gym(imageName: "gym2",
        title: "Always GYM",
        address: "Guatemala 4612, Buenos Aires 1425",
        openTime: "9:00",
        closeTime: "22:00",
        proximity: 1100,
        isOpen: true),
    Gym(imageName: "gym1",
        title: "Gimnasio XXL",
        address: "Paraguay 2450, Buenos Aires 1121",
        openTime: "8:00",
        closeTime: "10:00",
        proximity: 1200,
        isOpen: false),
    Gym(imageName: "gym2",
        title: "BIGG Palermo",
        address: "Guatemala 4612, Buenos Aires 1425",
        openTime: "9:00",
        closeTime: "22:00",
        proximity: 1100,
        isOpen: true),
    Gym(imageName: "gym1",
        title: "SportClub Palermo",
        address: "Paraguay 2450, Buenos Aires 1121",
        openTime: "9:00",
        closeTime: "22:00",
        proximity: 450,
        isOpen: true),
    Gym(imageName: "gym2",
        title: "Gym Hakkyo",
        address: "Guatemala 4612, Buenos Aires 1425",
        openTime: "9:00",
        closeTime: "22:00",
        proximity: 1100,
        isOpen: true),
    Gym(imageName: "gym1",
        title: "OpenClub",
        address: "Paraguay 2450, Buenos Aires 1121",
        openTime: "8:00",
        closeTime: "10:00",
        proximity: 1200,
        isOpen: false),
]
