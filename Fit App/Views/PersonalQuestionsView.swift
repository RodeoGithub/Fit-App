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
        
        return ZStack(alignment: .top) {
            Color(K.Colors.greyColor).ignoresSafeArea()
            navigationLink.frame(width: 0, height: 0)
            VStack (alignment: .center) {
                ProgressView(value: progressAmount, total:100)
                    .foregroundColor(Color(K.Colors.startColor))
                    .frame(width: 236, height: 10, alignment: .center)
                    .padding(.bottom,30)
                
                Text("Cuentanos Sobre ti!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                
                Button(action: {
                    withAnimation {
                        selectedGender.toggle()
                    }
                }) {
                    if !selectedGender {
                        Text("HOMBRE")
                            .bold()
                            .frame(width: 326, height: 60, alignment: .center)
                            .background(selectedColor)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                    else {
                        Text("HOMBRE")
                            .bold()
                            .frame(width: 326, height: 60, alignment: .center)
                            .background(unselectedColor)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                }.padding()
                
                Button(action: {
                    withAnimation {
                        selectedGender.toggle()
                    }
                }) {
                    if selectedGender {
                        Text("MUJER")
                            .bold()
                            .frame(width: 326, height: 60, alignment: .center)
                            .background(selectedColor)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                    else {
                        Text("MUJER")
                            .bold()
                            .frame(width: 326, height: 60, alignment: .center)
                            .background(unselectedColor)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .shadow(radius: 10)
                    }
                }.padding(.bottom,200)
                Button(action: {
                    withAnimation {
                        self.env.currentPage = .MotivationSelection
                    }
                }) {
                    Text("SIGUIENTE")
                        .bold()
                        .frame(width: 326, height: 60, alignment: .center)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(radius: 10)
                }.padding()
            }
        } //ZStack
    }
}


struct MotivationSelectionView: View {
    @EnvironmentObject var env: AppEnviromentData
    var body: some View {
        Text("")
    }
}



struct PersonalQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalQuestionsView()
    }
}
