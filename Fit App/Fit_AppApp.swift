//  Fit_AppApp.swift

import SwiftUI

@main
struct Fit_AppApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            HostNavigationView(viewRouter: viewRouter)
        }
    }
}

enum Navigation {
    case Home
    case Main
    case Login
    case GenderSelection
    case MotivationSelection
    case AgeInput
    case WeightInput
    case HeightInput
    case FrecuencySelection
    case HowItWorks
}
