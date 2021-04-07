//
//  MotivationSelectionView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 17/03/2021.
//

import SwiftUI

struct MotivationSelectionView: View {
    @EnvironmentObject var env: AppEnviromentData
    @StateObject var viewRouter: ViewRouter
    
    
    @State var progressAmount: Double = 33.4
    @State private var selection: String?
    @State var selected: Int = -1
    @State private var alertIsPresented = false
    
    var body: some View {
        ZStack (alignment: .top) {
            Color(K.Colors.gray15).ignoresSafeArea()
            VStack (alignment: .center) {
                Group{
                    VStack {
                        HStack {
                            Button(action: {
                                withAnimation(.easeOut) {
                                    viewRouter.currentView = .GenderSelection
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
                        Text("¿Qué es lo que más te motiva?")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                    }
                }.padding(.bottom)
                
                if selected == 0 {
                    LargeButton(title: "Sentirme seguro",
                                subtitle: "Quiero tener más confianza en mi mismo.",
                                iconName: "like") {
                        DispatchQueue.main.async {
                            selected = 0
                        }
                    }.overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(K.Colors.defaultGradient, lineWidth: 5)
                    )
                }
                else {
                    LargeButton(title: "Sentirme seguro",
                                subtitle: "Quiero tener más confianza en mi mismo.",
                                iconName: "like") {
                        DispatchQueue.main.async {
                            selected = 0
                        }
                    }
                }
                
                if selected == 1 {
                    LargeButton(title: "Perder peso",
                                subtitle: "Quiero perder peso con constancia y disciplina.",
                                iconName: "fit-body") {
                        DispatchQueue.main.async {
                            selected = 1
                        }
                    }.overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(K.Colors.defaultGradient, lineWidth: 5)
                    )
                }
                else {
                    LargeButton(title: "Perder peso",
                                subtitle: "Quiero perder peso con constancia y disciplina.",
                                iconName: "fit-body") {
                        DispatchQueue.main.async {
                            selected = 1
                        }
                    }
                }
                
                if selected == 2 {
                    LargeButton(title: "Ser activo",
                                subtitle: "Quiero sentirme enérgico, en forma y saludable",
                                iconName: "runner") {
                        DispatchQueue.main.async {
                            selected = 2
                        }
                    }.overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(K.Colors.defaultGradient, lineWidth: 5)
                    )
                }
                else {
                    LargeButton(title: "Ser activo",
                                subtitle: "Quiero sentirme enérgico, en forma y saludable",
                                iconName: "runner") {
                        DispatchQueue.main.async {
                            selected = 2
                        }
                    }
                }
                
                if selected == 3 {
                    LargeButton(title: "Ganar masa muscular",
                                subtitle: "Quiero ser y lucir más fuerte",
                                iconName: "muscle") {
                        DispatchQueue.main.async {
                            selected = 3
                        }
                    }.overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(K.Colors.defaultGradient, lineWidth: 5)
                    )
                }
                else {
                    LargeButton(title: "Ganar masa muscular",
                                subtitle: "Quiero ser y lucir más fuerte",
                                iconName: "muscle") {
                        DispatchQueue.main.async {
                            selected = 3
                        }
                    }
                }
                Spacer()
                RoundedButton(text: "SIGUIENTE",
                              withGradient: LinearGradient(gradient: Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]), startPoint: .leading, endPoint: .trailing),
                              foregroundColor: .white) {
                    if selected != -1 {
                        self.env.userMotivation = selected
                        withAnimation(.easeIn) {
                            viewRouter.currentView = .AgeInput
                        }
                    }
                    else {
                        alertIsPresented = true
                    }
                }.padding()
                
                .alert(isPresented: $alertIsPresented) {
                    Alert(title: Text("Por favor, Seleccione una opción"), dismissButton: .default(Text("OK!")))
                }
            }
        }
    }
}

struct MotivationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MotivationSelectionView(viewRouter: ViewRouter(), progressAmount: 40.0)
    }
}
