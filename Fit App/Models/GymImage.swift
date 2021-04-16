//  GymImage.swift

import Foundation

struct GymImage: Identifiable {
    let id = UUID()
    let name: String
    init(_ imageName: String) {
        self.name = imageName
    }
}
