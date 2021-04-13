//  Fit_AppApp.swift

import SwiftUI

@main
struct Fit_AppApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            //GymListView()
            HostNavigationView(viewRouter: viewRouter)
        }
    }
}

