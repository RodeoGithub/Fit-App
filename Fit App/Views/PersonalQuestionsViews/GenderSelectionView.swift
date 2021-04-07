//
//  GenderSelectionView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 17/03/2021.
//

import SwiftUI

struct GenderSelectionView: View {
    @EnvironmentObject var env: AppEnviromentData
    
    @StateObject var viewRouter: ViewRouter
    
    @State var progressAmount = 16.7
    @State var selectedGender = false
    
    let selectedColor = K.Colors.defaultGradient
    let unselectedColor = Color.gray
    
    var body: some View {
        ZStack {
            Color(K.Colors.gray15).edgesIgnoringSafeArea(.all)
            VStack (alignment: .center) {
                HStack {
                    Button(action: {
                        //
                    }) {
                        Image(systemName: "chevron.backward")
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                    }.padding()
                    .contentShape(Rectangle())
                    .padding()
                    .opacity(0)
                    ProgressView(value: progressAmount, total:100)
                        .frame(width: 236, alignment: .center)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color(K.Colors.startColor)))
                        .scaleEffect(1.2)
                        .shadow(radius: 10)
                    Spacer()
                }
                Text("Cuentanos Sobre ti!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                Spacer()
                if !selectedGender {
                    RoundedButton(text: "HOMBRE", withGradient: selectedColor, foregroundColor: .white) {
                        withAnimation {
                            selectedGender = false
                        }
                    }.padding()
                }
                else {
                    RoundedButton(text: "HOMBRE", backgroundColor: unselectedColor, foregroundColor: .black) {
                        withAnimation {
                            selectedGender = false
                        }
                    }.padding()
                }
                
                if selectedGender {
                    RoundedButton(text: "MUJER", withGradient: selectedColor, foregroundColor: .white) {
                        withAnimation{
                            selectedGender = true
                        }
                    }.padding()
                }
                else {
                    RoundedButton(text: "MUJER", backgroundColor: unselectedColor, foregroundColor: .black) {
                        withAnimation{
                            selectedGender = true
                        }
                    }.padding()
                }
                Spacer()
                RoundedButton(text: "SIGUIENTE", withGradient: selectedColor, foregroundColor: .white) {
                    withAnimation(.easeIn) {
                        self.env.userGender = selectedGender
                        viewRouter.currentView = .MotivationSelection
                    }
                }.padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#if DEBUG
struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelectionView(viewRouter: ViewRouter())
    }
}
#endif
