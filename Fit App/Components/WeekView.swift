//
//  WeekView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 29/03/2021.
//

import SwiftUI

struct WeekView: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(Color(K.Colors.gray19))
                .frame(width: 328, height: 158)
            VStack {
                HStack {
                    ForEach (K.daysOfTheWeek) { day in
                        VStack {
                            Text(day.shortName)
                                .foregroundColor(Color(K.Colors.gray72))
                            Circle()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color(K.Colors.gray27))
                        }
                    }
                }
                Button(action: {
                    // Expand week
                }) {
                    HStack {
                        Text("VER MI SEMANA")
                            .italic().bold()
                    }
                    .frame(width: 300, height: 40)
                    .cornerRadius(24) // doesnt work 
                    .foregroundColor(.white)
                    .background(Color(K.Colors.gray17))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                }
            }
        }
    }
}

struct dayOfTheWeek: Identifiable {
    let id = UUID()
    let name: String
    let shortName: String
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
