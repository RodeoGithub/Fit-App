//
//  FrecuencySelectionView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 18/03/2021.
//

import SwiftUI

struct FrecuencySelectionView: View {
    @EnvironmentObject var env: AppEnviromentData
    
    @StateObject var viewRouter: ViewRouter
    let padding:CGFloat = 16.0
    @State var progressAmount: Double = 100.0
    let tokens = [1,2,3,7]
    let passColor = [Color.blue,
                     Color.green,
                     Color(K.Colors.startColor),
                     Color(K.Colors.gray27),]
    @State var selectedFrecuency: Int = 0
    var body: some View {
        ZStack {
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
                Text("Con qué frecuencia entrenás?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("Inactivo")
                            .foregroundColor(Color(K.Colors.gray68))
                        Spacer()
                        Text("Muy activo")
                            .foregroundColor(Color(K.Colors.gray68))
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(K.Colors.gray72))
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 4, maxHeight: 4, alignment: .center)
                            .padding(16)
                        HStack {
                            Button(action: {
                                selectedFrecuency = 0
                            }, label: {
                                if selectedFrecuency == 0 {
                                    Circle()
                                        .foregroundColor(Color(K.Colors.startColor))
                                        .frame(width: 20, height: 20)
                                        .shadow(radius: 5)
                                }
                                else {
                                    Circle()
                                        .foregroundColor(Color(K.Colors.gray72))
                                        .frame(width: 10, height: 10)
                                        .shadow(radius: 5)
                                }
                            }).padding()
                            Spacer()
                            
                            Button(action: {
                                selectedFrecuency = 1
                            }, label: {
                                if selectedFrecuency == 1 {
                                    Circle()
                                        .foregroundColor(Color(K.Colors.startColor))
                                        .frame(width: 20, height: 20)
                                        .shadow(radius: 5)
                                }
                                else {
                                    Circle()
                                        .foregroundColor(Color(K.Colors.gray72))
                                        .frame(width: 10, height: 10)
                                        .shadow(radius: 5)
                                }
                            }).padding()
                            Spacer()
                            
                            Button(action: {
                                selectedFrecuency = 2
                            }, label: {
                                if selectedFrecuency == 2 {
                                    Circle()
                                        .foregroundColor(Color(K.Colors.startColor))
                                        .frame(width: 20, height: 20)
                                        .shadow(radius: 5)
                                }
                                else {
                                    Circle()
                                        .foregroundColor(Color(K.Colors.gray72))
                                        .frame(width: 10, height: 10)
                                        .shadow(radius: 5)
                                }
                            }).padding()
                            Spacer()
                            
                            Button(action: {
                                selectedFrecuency = 3
                            }, label: {
                                if selectedFrecuency == 3 {
                                    Circle()
                                        .foregroundColor(Color(K.Colors.startColor))
                                        .frame(width: 20, height: 20)
                                        .shadow(radius: 5)
                                }
                                else {
                                    Circle()
                                        .foregroundColor(Color(K.Colors.gray72))
                                        .frame(width: 10, height: 10)
                                        .shadow(radius: 5)
                                }
                            }).padding()
                        }
                    }.padding(.horizontal, 16)
                    
                    //MARK: -
                    
                    ZStack(alignment: .top){
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .foregroundColor(passColor[selectedFrecuency])
                            VStack {
                                Spacer()
                                HStack {
                                    Text("Plan IRON")
                                        .bold()
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("fitPass")
                                        .bold()
                                        .foregroundColor(.white)
                                }
                                .padding(.horizontal, 12)
                                .padding(.bottom,  10)
                            }
                        }.frame(height: 128)
                        
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundColor(.white)
                            .frame(height: 88)
                        VStack(){
                            Spacer()
                            HStack {
                                if selectedFrecuency == 0 {
                                    Text(K.Strings.Frecuency.frecuency0)
                                }
                                else if selectedFrecuency == 1 {
                                    Text(K.Strings.Frecuency.frecuency1)
                                }
                                else if selectedFrecuency == 2 {
                                    Text(K.Strings.Frecuency.frecuency2)
                                }
                                else {
                                    Text(K.Strings.Frecuency.frecuency3)
                                }
                                Image("runner")
                            }.padding()
                            Spacer()
                        }.frame(height: 88)
                    }.padding(.horizontal, 16)
                    HStack {
                        Spacer()
                        Text("\(tokens[selectedFrecuency]) ingresos / semana")
                            .foregroundColor(Color(K.Colors.gray68))
                    }.padding(.horizontal,18)
                }.padding(.horizontal, 16)
               
                Spacer()
                
                RoundedButton(text: "Finalizar", withGradient: K.Colors.defaultGradient, foregroundColor: .white) {
                    self.env.userFrecuency = selectedFrecuency
                    viewRouter.currentView = .HowItWorks
                }
            }
        }
    }
}
