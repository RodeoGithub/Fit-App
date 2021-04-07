//
//  AgeInputView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 17/03/2021.
//

import SwiftUI
import Combine

struct AgeInputView: View {
    @EnvironmentObject var env: AppEnviromentData
    @StateObject var viewRouter: ViewRouter
    
    @State var progressAmount: Double = 50.1
    @State var age: String = ""
    @State var alertIsPresented = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(K.Colors.gray15).ignoresSafeArea()
            VStack {
                Group {
                    HStack {
                        Button(action: {
                            withAnimation(.easeOut) {
                                viewRouter.currentView = .MotivationSelection
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
                    Text("Qué edad tenés?")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding()
                }
                Spacer()
                
                HStack {
                    Spacer()
                    TextField("Edad",text: $age)
                        .keyboardType(.numberPad)
                        .onReceive(Just(age)) { newValue in
                            let filtered = newValue.filter {"0123456789".contains($0)}
                            if filtered != newValue {
                                self.age = filtered
                            }
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Text("Años")
                        .font(Font.system(.body))
                        .foregroundColor(.gray)
                    Spacer()
                }
                Spacer()
                RoundedButton(text: "Siguiente", withGradient: K.Colors.defaultGradient, foregroundColor: .white) {
                    if age != "" {
                        self.env.userAge = Int(age)
                        viewRouter.currentView = .WeightInput
                    }
                    else {
                        alertIsPresented.toggle()
                    }
                }.padding()
                
                .alert(isPresented: $alertIsPresented) {
                    Alert(title: Text("Por favor, ingrese su edad"), dismissButton: .default(Text("OK!")))
 
                }
 
            }
        }
    }
}

struct AgeInputView_Previews: PreviewProvider {
    static var previews: some View {
        AgeInputView(viewRouter: ViewRouter(), progressAmount: 60.0)
    }
}
