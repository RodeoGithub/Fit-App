//  LoginView.swift

import SwiftUI

struct LoginView: View {
    @StateObject var viewRouter: ViewRouter
    
    var isFirstTime = true
    
    let user = User(email: "User@gmail.com", pass: "1234") //Hardcoded Validation
    
    @Binding var signInSuccess: Bool
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var alertIsPresented = false
    
    var body: some View {
        GeometryReader { (proxy: GeometryProxy) in
                ZStack(alignment: .top){
                    Color(K.Colors.gray15).ignoresSafeArea()
                    
                    Image("background")
                        .edgesIgnoringSafeArea(.top)
                    
                    VStack {
                        Image("full-logo")
                            .padding(.top,200)
                        
                        TextField("", text: $email)
                            .modifier(PlaceholderStyle(showPlaceholder: email.isEmpty, placeholder: "E-mail"))
                            .underlineTextField()
                            .foregroundColor(.white)
                            .disableAutocorrection(true)
                            
                        SecureField("", text: $password)
                            .modifier(PlaceholderStyle(showPlaceholder: password.isEmpty, placeholder: "Contraseña"))
                            .underlineTextField()
                            .foregroundColor(.white)
                            .disableAutocorrection(true)
                        
                        RoundedButton(text: "INICIAR SESIÓN",
                                      withGradient: LinearGradient(gradient:
                                                                    Gradient(colors: [Color(K.Colors.startColor), Color(K.Colors.endColor)]),
                                                                   startPoint: .leading,
                                                                   endPoint: .trailing),
                                      foregroundColor: .white) {
                            if email == user.email && password == user.pass {
                                withAnimation {
                                    if isFirstTime {
                                        viewRouter.currentView = .GenderSelection
                                    }
                                    else {
                                        viewRouter.currentView = .Home
                                    }
                                }
                            }
                            else {
                                alertIsPresented.toggle()
                            }
                        }.padding()
                        
                        Button(action: {
                            //TODO: Register
                        }) {
                            Text("REGISTRARSE CON EMAIL")
                        }
                        Spacer()
                        RoundedButton(text: "INICIAR SESIÓN CON GOOGLE",
                                      backgroundColor: .white, foregroundColor: .red) {
                            //TODO: Sign In with Google
                        }.padding(.all)
                        
                        RoundedButton(text: "INICIAR SESIÓN CON FACEBOOK",
                                      backgroundColor: .blue, foregroundColor: .white) {
                            //TODO: Sign In with Facebook
                        }.padding(.horizontal)
                        .padding(.bottom)
                        
                        Button(action: {
                            //TODO: Forgot password
                        }) {
                            Text("¿Has olvidado tu contraseña?")
                        }.padding(.bottom,30)
                    }
                }
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .top)
        }
        
        .alert(isPresented: $alertIsPresented) {
            Alert(title: Text("Ingreso Incorrecto"), message: Text("Usuario o contraseña incorrectos"), dismissButton: .default(Text("OK!")))
        }
    }
}

extension View {
    func underlineTextField() -> some View {
        self
            .padding(.vertical, 10)
            .foregroundColor(.gray)
            .overlay(Rectangle().frame(height:2).padding(.top, 35))
            .padding(.horizontal,30)
    }
}


#if DEBUG
struct LoginView_Previews: PreviewProvider {
    @State static var signInSuccess = false
    static var previews: some View {
        LoginView(viewRouter: ViewRouter(), signInSuccess: $signInSuccess)
    }
}
#endif
