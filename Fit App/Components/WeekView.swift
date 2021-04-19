//  WeekView.swift

import SwiftUI

struct WeekView: View {
    let expanded: Bool
    @StateObject var viewRouter: ViewRouter
    init(viewRouter: ViewRouter, withDetail expanded: Bool) {
        _viewRouter = StateObject(wrappedValue: viewRouter)
        self.expanded = expanded
    }
    
    var body: some View {
        ZStack(alignment: .top) {
//            RoundedRectangle(cornerRadius: 24)
//                .foregroundColor()
//                .frame(height: expanded ? 79 : 158)
            VStack {
//                HStack {
//                    Spacer()
                    HStack {
                        Spacer()
                        ForEach (K.daysOfTheWeek) { day in
                            VStack {
                                if Date().dayNumberOfTheWeek() == day.dayNumber {
                                    Text(day.shortName)
                                        .foregroundColor(Color(K.Colors.startColor))
                                    Circle()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Color(K.Colors.gray27))
                                }
                                else {
                                    Text(day.shortName)
                                        .foregroundColor(Color(K.Colors.gray72))
                                    Circle()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Color(K.Colors.gray27))
                                }
                            }
                        }
                        Spacer()
                    }
                    if !expanded {
                        Button(action: {
                            withAnimation {
                                viewRouter.currentView = .WeekDetail
                            }
                        }) {
                            HStack {
                                Spacer()
                                Text("VER MI SEMANA")
                                    .italic().bold()
                                    .padding(8)
                                Spacer()
                            }
                            .foregroundColor(.white)
                            .background(Color(K.Colors.gray17))
                            .cornerRadius(24)
                            .padding(.horizontal,16)
                            .padding(.top, 12)
                        }
                    }
//                    Spacer()
//                }
            }.padding(.vertical)
            .background(Color(K.Colors.gray19))
            .cornerRadius(16)
            .padding(16)
        }.padding([.leading, .trailing], expanded ? 0 : 32)
    }
}

struct DayOfTheWeek: Identifiable {
    let id = UUID()
    let name: String
    let shortName: String
    let dayNumber: Int
}

