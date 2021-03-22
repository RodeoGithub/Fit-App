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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var progressAmount: Double
    @State var age: String = ""
    @State var alertIsPresented = false
    
    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }.padding()
        .contentShape(Rectangle())
    }
    
    var body: some View {
        let navigationLink = NavigationLink(destination: WeightInputView(progressAmount:66.6),
                                            tag: .WeightInput,
                                            selection: $env.currentPage,
                                            label: { EmptyView() })
        ZStack(alignment: .top) {
            Color(K.Colors.grayColor).ignoresSafeArea()
            navigationLink.frame(width: 0, height: 0)
            VStack {
                Group {
                    ProgressView(value: progressAmount, total:100)
                        .frame(width: 236, alignment: .center)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color(K.Colors.startColor)))
                        .scaleEffect(1.2)
                        .shadow(radius: 10)
                    Text("Que edad tenes?")
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
                        .font(Font.system(size: 28))
                        .foregroundColor(.white)
                    Text("Años")
                        .font(Font.system(.body))
                        .foregroundColor(.gray)
                    Spacer()
                }
                Spacer()
                RoundedButton(text: "Siguiente", withGradient: K.Colors.defaultGradient, foregroundColor: .white) {
                    if age != "" {
                        env.userAge = Int(age)
                        env.currentPage = .WeightInput
                    }
                    else {
                        alertIsPresented = true
                    }
                }.padding()
                
                .alert(isPresented: $alertIsPresented) {
                    Alert(title: Text("Por favor, ingrese su edad"), dismissButton: .default(Text("OK!")))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarItems(leading: backButton)
    }
}

struct AgeInputView_Previews: PreviewProvider {
    static var previews: some View {
        AgeInputView(progressAmount: 60.0)
    }
}
