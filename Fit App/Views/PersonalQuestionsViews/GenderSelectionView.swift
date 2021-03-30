//
//  GenderSelectionView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 17/03/2021.
//

import SwiftUI

struct GenderSelectionView: View {
    @EnvironmentObject var env: AppEnviromentData
    @State var progressAmount = 16.7
    @State var selectedGender = false
    
    let selectedColor = K.Colors.defaultGradient
    let unselectedColor = Color.gray
    
    var body: some View {
        let navigationLink = NavigationLink(destination: MotivationSelectionView(progressAmount: 33.3),
                                            tag: .MotivationSelection,
                                            selection: $env.currentPage,
                                            label: { EmptyView() })
        ZStack {
            Color(K.Colors.gray15).edgesIgnoringSafeArea(.all)
            navigationLink.frame(width: 0, height: 0)
            VStack (alignment: .center) {
                ProgressView(value: progressAmount, total:100)
                    .frame(width: 236, alignment: .center)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color(K.Colors.startColor)))
                    .scaleEffect(1.2)
                    .shadow(radius: 10)
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
                RoundedButton(text: "SIGUIENTE",
                              withGradient: selectedColor,
                              foregroundColor: .white) {
                    print("Hola bro yo(1) funciono bien")
                    self.env.currentPage = .MotivationSelection
                }.padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#if DEBUG
struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelectionView()
    }
}
#endif
