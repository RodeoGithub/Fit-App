//
//  HowItWorksView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 19/03/2021.
//

import SwiftUI

struct HowItWorksView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack (alignment: .top){
                Color(K.Colors.gray15).ignoresSafeArea()
                VStack {
                    Group {
                        Text("Omitir")
                            .foregroundColor(.gray)
                            .fixedSize()
                            .padding(.trailing,30)
                    }.frame(width: geo.size.width, alignment: .topTrailing)
                    
                    Group {
                        Text("Como funciona?")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Image("full-logo")
                    }
                    Spacer()
                    Group {
                        CircularCheckmark()
                        Text("Elegi el centro de entrenamiento")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("Que mas te convenga.")
                            .fontWeight(.light)
                            .foregroundColor(.white)
                    }.padding(.horizontal,30)
                    
                    Group {
                        CircularCheckmark()
                        Text("Selecciona el entrenamiento")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text("que desees realizar.")
                            .fontWeight(.light)
                            .foregroundColor(.white)
                    }.padding(.horizontal,30)
                    
                    Group {
                        CircularCheckmark()
                        HStack {
                            Text("Reserva")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Text("tu entrenamiento")
                                .foregroundColor(.white)
                        }
                        VStack {
                            Text("Para reservar tu ingreso en el centro de entrenamiento debes tener minimo")
                                .foregroundColor(.white)
                            Text("1 credito fitPass disponible")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }.padding(.horizontal,30)
                    
                    Group {
                        CircularCheckmark()
                        Text("Ahora si que podes entrenar!")
                            .foregroundColor(.white)
                    }.padding(.horizontal,30)
                    
                    Spacer()
                    
                    RoundedButton(text: "COMPRAR CREDITOS", withGradient: K.Colors.defaultGradient, foregroundColor: .white) {
                        //TODO: Redirect to buy fitPass
                    }
                }
            }
        }
    }
}

struct CircularCheckmark: View {
    var body: some View {
        Circle()
            .frame(width: 29, height: 29, alignment: .center)
            .foregroundColor(.green)
            .overlay(Image(systemName: "checkmark")
                        .foregroundColor(.white)
            )
    }
}

struct HowItWorksView_Previews: PreviewProvider {
    static var previews: some View {
        HowItWorksView()
    }
}
