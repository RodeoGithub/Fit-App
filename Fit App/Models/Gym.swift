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
    let description: String?
    let activities: [ActivityType]?
    let minorFeatures: [MinorFeatures]?
    let images: [GymImage]?
    
    init(imageName: String,
         title: String,
         address: String,
         openTime: String,
         closeTime: String,
         proximity: Int,
         isOpen condition: Bool,
         images: [GymImage]?,
         description: String?,
         activities: [ActivityType]?,
         has minorFeatures: [MinorFeatures]?) {
        self.imageName = imageName
        self.address = address
        self.title = title
        self.openTime = openTime
        self.closeTime = closeTime
        self.proximity = proximity
        self.condition = condition
        self.images = images
        self.description = description
        self.activities = activities
        self.minorFeatures = minorFeatures
    }
    
    convenience init(imageName: String,
         title: String,
         address: String,
         openTime: String,
         closeTime: String,
         proximity: Int,
         isOpen condition: Bool) {
        self.init(imageName: imageName,
                  title: title,
                  address: address,
                  openTime: openTime,
                  closeTime: closeTime,
                  proximity: proximity,
                  isOpen: condition,
                  images: nil,
                  description: nil,
                  activities: nil,
                  has: nil)
    }
    
    convenience init(imageName: String,
         title: String,
         address: String,
         openTime: String,
         closeTime: String,
         proximity: Int,
         isOpen condition: Bool,
         images: [GymImage]) {
        self.init(imageName: imageName,
                  title: title,
                  address: address,
                  openTime: openTime,
                  closeTime: closeTime,
                  proximity: proximity,
                  isOpen: condition,
                  images: images,
                  description: nil,
                  activities: nil,
                  has: nil)
    }
    
    convenience init(imageName: String,
         title: String,
         address: String,
         openTime: String,
         closeTime: String,
         proximity: Int,
         isOpen condition: Bool,
         images: [GymImage],
         description: String) {
        self.init(imageName: imageName,
                  title: title,
                  address: address,
                  openTime: openTime,
                  closeTime: closeTime,
                  proximity: proximity,
                  isOpen: condition,
                  images: images,
                  description: description,
                  activities: nil,
                  has: nil)
    }
    
    convenience init(imageName: String,
         title: String,
         address: String,
         openTime: String,
         closeTime: String,
         proximity: Int,
         isOpen condition: Bool,
         images: [GymImage],
         description: String,
         activities: [ActivityType]) {
        self.init(imageName: imageName,
                  title: title,
                  address: address,
                  openTime: openTime,
                  closeTime: closeTime,
                  proximity: proximity,
                  isOpen: condition,
                  images: images,
                  description: description,
                  activities: activities,
                  has: nil)
    }
}

enum MinorFeatures {
    case Wifi
    case Shower
    case Parking
    case LockerRoom
    case Dispenser
}

// MARK: Test Data

let testPoolShift = [Shift(place: "Aquagym", type: .Pool, startTime: "9:00", endTime: "13:00", maxCapacity: 50),
                     Shift(place: "Aquagym", type: .Pool, startTime: "14:00", endTime: "17:59", maxCapacity: 50),
                     Shift(place: "Aquagym", type: .Pool, startTime: "18:00", endTime: "22:00", maxCapacity: 50)]

let testGymShift = [Shift(place: "Sala de pesas", type: .Gym, startTime: "9:00", endTime: "10:00", maxCapacity: 50),
                    Shift(place: "Sala de pesas",type: .Gym, startTime: "10:00", endTime: "11:00", maxCapacity: 50),
                    Shift(place: "Sala de pesas",type: .Gym, startTime: "11:00", endTime: "12:00", maxCapacity: 50),
                    Shift(place: "Sala de pesas",type: .Gym, startTime: "12:00", endTime: "13:00", maxCapacity: 50),
                    Shift(place: "Sala de pesas",type: .Gym, startTime: "13:00", endTime: "14:00", maxCapacity: 50),
                    Shift(place: "Sala de pesas",type: .Gym, startTime: "14:00", endTime: "15:00", maxCapacity: 50),
                    Shift(place: "Sala de pesas",type: .Gym, startTime: "15:00", endTime: "16:00", maxCapacity: 50),
                    Shift(place: "Sala de pesas",type: .Gym, startTime: "16:00", endTime: "17:00", maxCapacity: 50),
                    Shift(place: "Sala de pesas",type: .Gym, startTime: "18:00", endTime: "19:00", maxCapacity: 50)
]

let testLessonShift = [Shift(place: "Sala",type: .Lesson, startTime: "9:00", endTime: "10:00", maxCapacity: 50),
                    Shift(place: "Sala",type: .Lesson, startTime: "10:00", endTime: "11:00", maxCapacity: 50),
                    Shift(place: "Sala",type: .Lesson, startTime: "11:00", endTime: "12:00", maxCapacity: 50),
                    Shift(place: "Sala",type: .Lesson, startTime: "12:00", endTime: "13:00", maxCapacity: 50),
                    Shift(place: "Sala",type: .Lesson, startTime: "13:00", endTime: "14:00", maxCapacity: 50),
                    Shift(place: "Sala",type: .Lesson, startTime: "14:00", endTime: "15:00", maxCapacity: 50),
                    Shift(place: "Sala",type: .Lesson, startTime: "15:00", endTime: "16:00", maxCapacity: 50),
                    Shift(place: "Sala",type: .Lesson, startTime: "16:00", endTime: "17:00", maxCapacity: 50),
                    Shift(place: "Sala",type: .Lesson, startTime: "18:00", endTime: "19:00", maxCapacity: 50)
]


let testGymImages = [GymImage("gym1-fullsize"), GymImage("full-logo"), GymImage("gym1-fullsize")]

let gymTestList = [
    Gym(imageName: "gym1",
        title: "Gimnasio Taurus",
        address: "Paraguay 2450, Buenos Aires 1121",
        openTime: "9:00",
        closeTime: "22:00",
        proximity: 450,
        isOpen: true,
        images: testGymImages,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sapien lacus, interdum non lectus vitae, tempus auctor quam. In in posuere justo, et congue lectus. Nulla sapien metus, ultrices nec lacus sit amet, eleifend mattis ligula.",
        activities: [.Gym,.Pool,.Lesson],
        has: [.Wifi,.Shower,.Dispenser,.Parking,.LockerRoom]),
    
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
