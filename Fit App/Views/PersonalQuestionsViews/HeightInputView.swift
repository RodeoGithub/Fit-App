//
//  HeightInputView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 22/03/2021.
//

import SwiftUI
import Combine

struct HeightInputView: View {
    @EnvironmentObject var env: AppEnviromentData
    
    @StateObject var viewRouter: ViewRouter
    
    @State var progressAmount: Double = 83.4
    @State var unit: Bool = true
    @State var height: String = ""
    
    @State var alertIsPresented = false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color(K.Colors.gray15).ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: {
                        withAnimation(.easeOut) {
                            viewRouter.currentView = .WeightInput
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
                
                Text("Cuál es tu altura actual?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                Spacer()
                HStack {
                    if unit { //Cm Selected
                        Button (action: {
                            self.unit = true
                        }) {
                            Text("Cm")
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
                            Text("Pies")
                                .frame(width: 60, height: 40)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    else {
                        Button(action: {
                            self.unit = true
                        }) {
                            Text("Cm")
                                .frame(width: 60, height: 40)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        Button (action: {
                            self.unit = false
                        }) {
                            Text("Pies")
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
                    TextField("Alt.",text: $height)
                        .keyboardType(.numberPad)
                        .onReceive(Just(height)) { newValue in
                            let filtered = newValue.filter {"0123456789".contains($0)}
                            if filtered != newValue {
                                self.height = filtered
                            }
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    if unit {
                        Text("Cm")
                            .font(Font.system(.body))
                            .foregroundColor(.gray)
                    }
                    else {
                        Text("Pies")
                            .font(Font.system(.body))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                Spacer()
                RoundedButton(text: "Siguiente", withGradient: K.Colors.defaultGradient, foregroundColor: .white) {
                    if height != "" {
                        self.env.userHeight = Int(height)
                        viewRouter.currentView = .FrecuencySelection
                    }
                    else {
                        alertIsPresented.toggle()
                    }
                    
                }.padding()
                
                .alert(isPresented: $alertIsPresented) {
                    Alert(title: Text("Por favor, ingrese su altura actual"), dismissButton: .default(Text("OK!")))
                }
            }
        }
    }
}

struct HeightInputView_Previews: PreviewProvider {
    static var previews: some View {
        HeightInputView(viewRouter: ViewRouter())
    }
}
