//
//  LoginView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 11/03/2021.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Binding var signInSuccess: Bool
    var body: some View {
        GeometryReader { (proxy: GeometryProxy) in
                ZStack(alignment: .top){
                    Color(K.Colors.greyColor)
                    
                    Image("background")
                        .edgesIgnoringSafeArea(.top)
                    
                    VStack {
                        Image("full-logo")
                            .padding(.top,200)
                        
                        TextField("E-mail", text: $email)
                            .foregroundColor(.white)
                            .underlineTextField()
                            .foregroundColor(.white)
                        
                        SecureField("Contraseña", text: $password)
                            .foregroundColor(.white)
                            .underlineTextField()
                            .foregroundColor(.white)
                        
                        Button(action: {
                            withAnimation {
                                signInSuccess.toggle()
                            }
                        }) {
                            Text("INICIAR SESIÓN")
                                .bold()
                                .frame(width: 326, height: 60, alignment: .center)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]), startPoint: .leading, endPoint: .trailing))
                                .foregroundColor(.white)
                                .cornerRadius(30)
                                .shadow(radius: 10)
                        }.padding()
                        
                        Button(action: {
                            //TODO:
                        }) {
                            Text("REGISTRARSE CON EMAIL")
                        }
                        
                        Button(action: {
                            //TODO
                        }) {
                            Text("INICIAR SESIÓN CON GOOGLE")
                                .bold()
                                .frame(width: 326, height: 60, alignment: .center)
                                .background(Color.white)
                                .foregroundColor(.red)
                                .cornerRadius(30)
                                .shadow(radius: 10)
                        }.padding(.top,40)
                        Button(action: {
                            //TODO
                        }) {
                            Text("INICIAR SESIÓN CON FACEBOOK")
                                .bold()
                                .frame(width: 326, height: 60, alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                                .shadow(radius: 10)
                        }.padding()
                        Button(action: {
                            //TODO:
                        }) {
                            Text("¿Has olvidado tu contraseña?")
                        }
                    }
                }
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .top)
        }
    }
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .overlay(Rectangle().frame(height:2).padding(.top, 35))
            .padding(.horizontal,30)
    }
}


#if DEBUG
struct LoginView_Previews: PreviewProvider {
    @State static var signInSuccess = false
    static var previews: some View {
        LoginView(signInSuccess: $signInSuccess)
    }
}
#endif
