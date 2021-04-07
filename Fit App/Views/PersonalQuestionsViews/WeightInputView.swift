//
//  WeightInputView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 18/03/2021.
//

import SwiftUI
import Combine

struct WeightInputView: View {
    @EnvironmentObject var env: AppEnviromentData
    
    @StateObject var viewRouter: ViewRouter
    
    @State var progressAmount: Double = 66.7
    @State var weight: String = ""
    @State var unit: Bool = true
    @State var alertIsPresented = false

    var body: some View {
        ZStack(alignment: .top) {
            Color(K.Colors.gray15).ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        withAnimation(.easeOut) {
                            viewRouter.currentView = .AgeInput
                        }
                    }) {
                        Image(systemName: "chevron.backward")
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                    }.padding()
                    .contentShape(Rectangle())
                    .padding()
                    ProgressView(value: progressAmount, total:100)
                        .frame(width: 236, alignment: .center)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color(K.Colors.startColor)))
                        .scaleEffect(1.2)
                        .shadow(radius: 10)
                    Spacer()
                }
                
                Text("Cuál es tu peso actual?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                Spacer()
                HStack {
                    if unit { //Kg Selected
                        Button (action: {
                            self.unit = true
                        }) {
                            Text("Kg")
                                .frame(width: 60, height: 40)
                                .background(K.Colors.defaultGradient)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }
                        .padding()
                        Button(action: {
                            self.unit = false
                        }) {
                            Text("Lb")
                                .frame(width: 60, height: 40)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    else {
                        Button(action: {
                            self.unit = true
                        }) {
                            Text("Kg")
                                .frame(width: 60, height: 40)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        Button (action: {
                            self.unit = false
                        }) {
                            Text("Lb")
                                .frame(width: 60, height: 40)
                                .background(K.Colors.defaultGradient)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }
                        .padding()
                    }
                }
                HStack {
                    Spacer()
                    TextField("Peso",text: $weight)
                        .keyboardType(.numberPad)
                        .onReceive(Just(weight)) { newValue in
                            let filtered = newValue.filter {"0123456789".contains($0)}
                            if filtered != newValue {
                                self.weight = filtered
                            }
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    if unit {
                        Text("Kg")
                            .font(Font.system(.body))
                            .foregroundColor(.gray)
                    }
                    else {
                        Text("Lb")
                            .font(Font.system(.body))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                Spacer()
                RoundedButton(text: "Siguiente", withGradient: K.Colors.defaultGradient, foregroundColor: .white) {
                    if weight != "" {
                        self.env.userWeight = Int(weight)
                        
                        viewRouter.currentView = .HeightInput
                    }
                    else {
                        alertIsPresented = true
                    }
                }.padding()
                
                .alert(isPresented: $alertIsPresented) {
                    Alert(title: Text("Por favor, Ingrese su peso actual"), dismissButton: .default(Text("OK!")))
                }
            }
        }
    }
}

