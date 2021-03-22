//
//  LargeButton.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 14/03/2021.
//

import SwiftUI

struct LargeButton: View {
    
    let title: String
    let subtitle: String
    let iconName: String
    var isSelected: Bool = false
    let function: () -> Void
    
    var body: some View {
        if self.isSelected {
            return AnyView(Button(action: function) {
                HStack (alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(title)
                            .fontWeight(.bold)
                            .font(Font.system(size: 18))
                            .padding()
                            .foregroundColor(.black)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                        Text(subtitle)
                            .foregroundColor(.gray)
                            .font(Font.system(size: 14))
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 5)
                    }.padding(5)
                    Image(iconName)
                }
                .frame(width: 328, height: 78, alignment: .topLeading)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(LinearGradient(gradient:
                                                Gradient(colors: [Color(K.Colors.startColor),Color(K.Colors.endColor)]),
                                               startPoint: .leading,
                                               endPoint: .trailing),
                                lineWidth: 5)
                )
            })
        }
        else {
            return AnyView(Button(action: function) {
                HStack (alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(title)
                            .fontWeight(.bold)
                            .font(Font.system(size: 18))
                            .foregroundColor(.black)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                        Text(subtitle)
                            .foregroundColor(.gray)
                            .font(Font.system(size: 14))
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 5)
                    }.frame(width: (328 * 0.67), height: 78, alignment: .leading)
                    .padding(5)
                    Image(iconName)
                        .frame(width: (328 * 0.33), height: 78, alignment: .center)
                }
                .frame(width: 328, height: 78, alignment: .center)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            })
        }
    }
}

struct LargeButton_Previews: PreviewProvider {
    @State static var isSelected = false
    static var previews: some View {
        LargeButton(title:"TEST!", subtitle: "SUBTEST", iconName: "fit-body") {}
    }
}
