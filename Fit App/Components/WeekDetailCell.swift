//  WeekDetailCell.swift

import SwiftUI

struct WeekDetailCell: View {
    let activity: Activity
    
    init(_ activity: Activity) {
        self.activity = activity
    }
    
    var body: some View {
        ZStack {
            Color.white
            HStack {
                Image(activity.gym.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 72, height: 72)
                    .padding(8)
                VStack(alignment: .leading){
                    Text(activity.gym.title)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.vertical, 1)
                    GymWorkTimeView(openTime: activity.gym.openTime, closeTime: activity.gym.closeTime)
                        .padding(.vertical, 1)
                    HStack {
                        GymPlaceView(at: activity.place, ofType: activity.type)
                        Spacer()
                        switch activity.type {
                        case .Gym:
                            Text("GIMNASIO")
                                .font(.footnote)
                                .foregroundColor(.orange)
                        case .Pool:
                            Text("PILETA")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        case .Lesson:
                            Text("CLASE")
                                .font(.footnote)
                                .foregroundColor(.green)
                        }
                    }.padding(.vertical, 1)
                }
            }.padding()
        }.cornerRadius(16)
        .padding(.horizontal)
        .padding(.vertical,4)
        .shadow(radius: 5)
    }
}

struct WeekDetailCellEmptyVertical: View {
    var body: some View {
        Button(action: {
            //add training
        }) {
            HStack {
                Spacer()
                Label("Agregar Entrenamiento", systemImage: "plus.circle")
                    .padding()
                    .font(Font.system(size: 22, weight: .bold, design: .default))
                    //.background(Color(K.Colors.gray68))
                    .foregroundColor(.white)
                    //.cornerRadius(16)
                    .labelStyle(VerticalLabelStyle())
                Spacer()
            }
            .background(Color(K.Colors.gray68))
            .cornerRadius(18)
            .padding(.horizontal)
            .padding(.vertical,4)
        }
    }
}

struct WeekDetailCellEmptyHorizontal: View {
    var body: some View {
        Button(action: {
            //add training
        }) {
            HStack {
                Spacer()
                Label("Agregar Entrenamiento", systemImage: "plus.circle")
                    .padding()
                    .font(Font.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Spacer()
            }
            .background(Color(K.Colors.gray68))
            .cornerRadius(18)
            .padding(.horizontal)
            .padding(.vertical,4)
        }
    }
}
