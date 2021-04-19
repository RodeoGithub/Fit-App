//  ViewRouter.swift

import Foundation

class ViewRouter: ObservableObject {
    @Published var currentView: Navigation = .Main
}

enum Navigation {
    case Main
    case Login
    case Home
    case WeekDetail
    case GenderSelection
    case MotivationSelection
    case AgeInput
    case WeightInput
    case HeightInput
    case FrecuencySelection
    case HowItWorks
}
