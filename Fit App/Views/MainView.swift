//
//  MainView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 11/03/2021.
//

import SwiftUI
import Combine

struct MainView: View {
    @State var signInSuccess = false
    @StateObject var env: AppEnviromentData = AppEnviromentData()
    var body: some View {
        return Group {
            if signInSuccess {
                PersonalQuestionsView().environmentObject(env)
            }
            else {
                LoginView(signInSuccess: $signInSuccess)
            }
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
