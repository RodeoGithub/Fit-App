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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var progressAmount: Double
    @State var unit: Bool = true
    @State var height: String = ""
    
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
        let navigationLink = NavigationLink(destination: FrecuencySelectionView(progressAmount: 100.0),
                                            tag: .FrecuencySelection,
                                            selection: $env.currentPage, label: {EmptyView()})
        
        ZStack(alignment: .top) {
            Color(K.Colors.gray15).ignoresSafeArea()
            navigationLink.frame(width: 0, height: 0)
            VStack {
                ProgressView(value: progressAmount, total:100)
                    .frame(width: 236, alignment: .center)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color(K.Colors.startColor)))
                    .scaleEffect(1.2)
                    .shadow(radius: 10)
                Text("Cual es tu altura actual?")
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
                        .font(Font.system(size: 28))
                        .foregroundColor(.white)
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
                    env.userWeight = Int(height)
                    env.currentPage = .HeightInput
                }.padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct HeightInputView_Previews: PreviewProvider {
    static var previews: some View {
        HeightInputView(progressAmount: 83.3)
    }
}
