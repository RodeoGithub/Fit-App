//
//  FrecuencySelectionView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 18/03/2021.
//

import SwiftUI

struct FrecuencySelectionView: View {
    @EnvironmentObject var env: AppEnviromentData
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var progressAmount: Double
    @State var frecuency: Int = 0
    var body: some View {
        Text("Con que frecuencia entrenas?")
        //TODO: Frecuency View
        RoundedButton(text: "Finalizar", withGradient: K.Colors.defaultGradient, foregroundColor: .white) {
            env.userFrecuency = frecuency
        }
    }
}
