//
//  RoundedButton.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 12/03/2021.
//

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
                    Text(text)
                        .bold()
                        .frame(width: 326, height: 60, alignment: .center)
                        .background(bc)
                        .foregroundColor(foregroundColor)
                        .cornerRadius(30)
                        .shadow(radius: 10)
                }
            )
        }
        else if let bg = backgroundGradient {
            return AnyView(
                Button(action: function) {
                    Text(text)
                        .bold()
                        .frame(width: 326, height: 60, alignment: .center)
                        .background(bg)
                        .foregroundColor(foregroundColor)
                        .cornerRadius(30)
                        .shadow(radius: 10)
                }
            )
        }
        else {
            return AnyView(
                Button(action: function) {
                        Text(text)
                            .bold()
                            .frame(width: 326, height: 60, alignment: .center)
                            .background(Color.white)
                            .foregroundColor(.gray)
                            .cornerRadius(30)
                            .shadow(radius: 10)
                }
            )
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(text: "Preview", backgroundColor: .white, foregroundColor: .white) {}
    }
}
