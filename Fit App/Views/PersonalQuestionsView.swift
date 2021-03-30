//
//  PersonalQuestionsView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 11/03/2021.
//

import SwiftUI
import Combine

enum PersonalQuestions {
    case GenderSelection
    case MotivationSelection
    case AgeInput
    case WeightInput
    case HeightInput
    case FrecuencySelection
}

struct PersonalQuestionsView: View {
    @EnvironmentObject var env: AppEnviromentData
    //@State var progressAmount = 20.00
    var body: some View {
        NavigationView {
            GenderSelectionView()
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarColor(K.Colors.gray15)
    }
}

struct PersonalQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalQuestionsView()
    }
}
