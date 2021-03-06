//  WeightUnitToggleStyle.swift

import SwiftUI

struct WeightUnitToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.label
                Spacer()
                Text("kg")
                Rectangle()
                    .foregroundColor(configuration.isOn ? .green : .gray)
                    .frame(width: 51, height: 31, alignment: .center)
                    .overlay(
                        Circle()
                            .foregroundColor(.white)
                            .padding(.all, 3)
                            .overlay(
                                Image(systemName: configuration.isOn ? "checkmark" : "xmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .font(Font.title.weight(.black))
                                    .frame(width: 8, height: 8, alignment: .center)
                                    .foregroundColor(configuration.isOn ? .green : .gray)
                            )
                            .offset(x: configuration.isOn ? 11 : -11, y: 0)
                            .animation(Animation.linear(duration: 0.1))
                    ).cornerRadius(20)
                    .onTapGesture { configuration.isOn.toggle() }
                Text("lb")
            }
        }
}

