//  HostNavigationView.swift

import SwiftUI

struct HostNavigationView: View {
    @StateObject var viewRouter: ViewRouter
    @State var isLoggedIn: Bool = false
    @StateObject var env = AppEnviromentData()
    var body: some View {
        switch viewRouter.currentView {
        case .Home:
            HomeView(viewRouter: viewRouter)
                .environmentObject(env)
        case .WeekDetail:
            WeekDetailView(viewRouter: viewRouter)
        case .Main:
            MainView(viewRouter: viewRouter)
        case .Login:
            LoginView(viewRouter: viewRouter, signInSuccess: $isLoggedIn)
        case .GenderSelection:
            GenderSelectionView(viewRouter: viewRouter)
                .environmentObject(env)
        case .MotivationSelection:
            MotivationSelectionView(viewRouter: viewRouter)
                .environmentObject(env)
        case .AgeInput:
            AgeInputView(viewRouter: viewRouter)
                .environmentObject(env)
        case .WeightInput:
            WeightInputView(viewRouter: viewRouter)
                .environmentObject(env)
        case .HeightInput:
            HeightInputView(viewRouter: viewRouter)
                .environmentObject(env)
        case .FrecuencySelection:
            FrecuencySelectionView(viewRouter: viewRouter)
                .environmentObject(env)
        case .HowItWorks:
            HowItWorksView(viewRouter: viewRouter)
        }
 
    }
 
}
