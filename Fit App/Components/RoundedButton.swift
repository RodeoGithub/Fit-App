//  RoundedButton.swift

import SwiftUI

struct RoundedButton: View {
    let backgroundColor: Color?
    let backgroundGradient: LinearGradient?
    let function: () -> Void
    let text: String
    let foregroundColor: Color?
    
    init(text txt: String, backgroundColor bc: Color, foregroundColor fc: Color?, action: @escaping () -> Void) {
        self.backgroundColor = bc
        self.foregroundColor = fc
        self.text = txt
        self.function = action
        self.backgroundGradient = nil
    }
    
    init(text txt: String, withGradient g: LinearGradient, foregroundColor fc: Color?, action: @escaping () -> Void) {
        self.backgroundGradient = g
        self.foregroundColor = fc
        self.text = txt
        self.function = action
        self.backgroundColor = nil
    }
    
    var body: some View {
        if let bc = backgroundColor {
            return AnyView(
                Button(action: function) {
                    HStack {
                        Text(text)
                            .bold()
                            .foregroundColor(foregroundColor)
                            .padding(.vertical)
                    }.background(bc)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                }
            )
        }
        else if let bg = backgroundGradient {
            return AnyView(
                Button(action: function) {
                    HStack {
                        Spacer()
                        Text(text)
                            .bold()
                            .foregroundColor(foregroundColor)
                            .padding(.vertical)
                        Spacer()
                    }
                    .background(bg)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                }
            )
        }
        else {
            return AnyView(
                Button(action: function) {
                    HStack {
                        Spacer()
                        Text(text)
                            .bold()
                            .background(Color.white)
                            .foregroundColor(.gray)
                            .padding(.vertical)
                        Spacer()
                    }.cornerRadius(30)
                    .shadow(radius: 10)
                }
            )
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(text: "Preview", backgroundColor: .white, foregroundColor: .black) {}
    }
}
