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
                            .underlineTextField()
                            .foregroundColor(.white)
                        
                        SecureField("Contraseña", text: $password)
                            .underlineTextField()
                            .foregroundColor(.white)
                        
                        RoundedButton(text: "INICIAR SESIÓN",
                                      withGradient: LinearGradient(gradient:
                                                                    Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]),
                                                                   startPoint: .leading,
                                                                   endPoint: .trailing),
                                      foregroundColor: .white) {
                            withAnimation {
                                signInSuccess.toggle()
                            }
                        }.padding()
                        
                        Button(action: {
                            //TODO: Register
                        }) {
                            Text("REGISTRARSE CON EMAIL")
                        }
                        
                        RoundedButton(text: "INICIAR SESIÓN CON GOOGLE",
                                      backgroundColor: .white, foregroundColor: .red) {
                            //TODO: Sign In with Google
                        }.padding(.top, 40)
                        
                        RoundedButton(text: "INICIAR SESIÓN CON FACEBOOK",
                                      backgroundColor: .blue, foregroundColor: .white) {
                            //TODO: Sign In with Facebook
                        }.padding()
                        
                        Button(action: {
                            //TODO: Forgot password
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
