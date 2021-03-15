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
}

final class AppEnviromentData: ObservableObject {
    @Published var currentPage: PersonalQuestions? = .GenderSelection
}

struct PersonalQuestionsView: View {
    var body: some View {
        NavigationView {
            GenderSelectionView()
        }
    }
}

struct GenderSelectionView: View {
    @EnvironmentObject var env: AppEnviromentData
    
    @State var selectedGender = false
    
    @State var progressAmount = 20.0
    
    let selectedColor = LinearGradient(gradient: Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]), startPoint: .leading, endPoint: .trailing)
    let unselectedColor = Color.gray
    
    var body: some View {
        let navigationLink = NavigationLink(destination: MotivationSelectionView(),
                                            tag: .MotivationSelection,
                                            selection: $env.currentPage,
                                            label: { EmptyView() })
        
        return GeometryReader { (geometry) in
            ZStack(alignment: .top) {
                Color(K.Colors.greyColor).ignoresSafeArea()
                navigationLink.frame(width: 0, height: 0)
                VStack (alignment: .center) {
                    ProgressView(value: progressAmount, total:100)
                        .frame(width: 236, height: 10, alignment: .center)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color(K.Colors.startColor)))
                        .scaleEffect(1.2)
                        .shadow(radius: 10)
                        .padding(.bottom,30)
                    
                    Text("Cuentanos Sobre ti!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    
                    if !selectedGender {
                        RoundedButton(text: "HOMBRE", withGradient: selectedColor, foregroundColor: .white) {
                            withAnimation {
                                selectedGender.toggle()
                            }
                        }.padding()
                    }
                    else {
                        RoundedButton(text: "HOMBRE", backgroundColor: unselectedColor, foregroundColor: .black) {
                            withAnimation {
                                selectedGender.toggle()
                            }
                        }.padding()
                    }
                    
                    if selectedGender {
                        RoundedButton(text: "MUJER", withGradient: selectedColor, foregroundColor: .white) {
                            withAnimation{
                                selectedGender.toggle()
                            }
                        }.padding()
                    }
                    else {
                        RoundedButton(text: "MUJER", backgroundColor: unselectedColor, foregroundColor: .black) {
                            withAnimation{
                                selectedGender.toggle()
                            }
                        }.padding()
                    }
                    
                    RoundedButton(text: "SIGUIENTE",
                                  withGradient: selectedColor,
                                  foregroundColor: .white) {
                        withAnimation {
                            self.env.currentPage = .MotivationSelection
                        }
                    }.padding(.top, 300)
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .top) //VStack
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .top) //ZStack
        }
    }
}


struct MotivationSelectionView: View {
    @EnvironmentObject var env: AppEnviromentData
    @State private var selection: String?
    @State var progressAmount = 40.0
    
    var body: some View {
        return GeometryReader { (geometry) in
            ZStack (alignment: .top) {
                Color(K.Colors.greyColor).ignoresSafeArea()
                VStack (alignment: .center) {
                    ProgressView(value: progressAmount, total:100)
                        .frame(width: 236, height: 10, alignment: .center)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color(K.Colors.startColor)))
                        .scaleEffect(1.2)
                        .shadow(radius: 10)
                        .padding(.bottom,30)
                    Text("¿Qué es lo que más te motiva?")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                    
                    LargeButton(title: "Sentirme seguro",
                                subtitle: "Quiero tener más confianza en mi mismo.",
                                iconName: "like") {
                        //TODO: Highlight Button
                    }
                    
                    LargeButton(title: "Perder peso",
                                subtitle: "Quiero perder peso con constancia y disciplina.",
                                iconName: "fit-body") {
                        //TODO: Highlight Button
                    }
                    
                    LargeButton(title: "Ser activo",
                                subtitle: "Quiero sentirme enérgico, en forma y saludable",
                                iconName: "runner") {
                        //TODO: Highlight Button
                    }
                    
                    LargeButton(title: "Ganar masa muscular",
                                subtitle: "Quiero ser y lucir más fuerte",
                                iconName: "muscle") {
                        //TODO: Highlight Button
                    }
                    
                    RoundedButton(text: "SIGUIENTE",
                                  withGradient: LinearGradient(gradient: Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]), startPoint: .leading, endPoint: .trailing),
                                  foregroundColor: .white) { }.padding(30)
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        }
        else {
            self
        }
    }
}

func toggleButtons() {
    
}

struct PersonalQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalQuestionsView()
    }
}
