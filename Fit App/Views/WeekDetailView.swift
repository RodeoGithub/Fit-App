//  WeekDetailView.swift

import SwiftUI

struct WeekDetailView: View {
    var testWeek = Week()
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        ZStack(alignment: .top){
            Color(K.Colors.gray17).ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation{
                            viewRouter.currentView = .Home
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(Font.title)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.vertical,4)
                }
                ScrollView {
                    WeekView(viewRouter: viewRouter, withDetail: true)
                    VStack {
                        Group {
                            HStack {
                                Text("Domingo")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Date().dayNumberOfTheWeek() == K.daysOfTheWeek[0].dayNumber ? .orange : .white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                Spacer()
                            }
                            DayActivities(testWeek.sunday)
                        }
                        Group {
                            HStack {
                                Text("Lunes")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Date().dayNumberOfTheWeek() == K.daysOfTheWeek[1].dayNumber ? .orange : .white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                Spacer()
                            }
                            DayActivities(testWeek.monday)
                        }
                        Group {
                            HStack {
                                Text("Martes")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Date().dayNumberOfTheWeek() == K.daysOfTheWeek[2].dayNumber ? .orange : .white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                Spacer()
                            }
                            DayActivities(testWeek.tuesday)
                        }
                        Group {
                            HStack {
                                Text("Miércoles")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Date().dayNumberOfTheWeek() == K.daysOfTheWeek[3].dayNumber ? .orange : .white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                Spacer()
                            }
                            DayActivities(testWeek.wednesday)
                        }
                        Group {
                            HStack {
                                Text("Jueves")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Date().dayNumberOfTheWeek() == K.daysOfTheWeek[4].dayNumber ? .orange : .white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                Spacer()
                            }
                            DayActivities(testWeek.thursday)
                        }
                        Group {
                            HStack {
                                Text("Viernes")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Date().dayNumberOfTheWeek() == K.daysOfTheWeek[5].dayNumber ? .orange : .white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                Spacer()
                            }
                            DayActivities(testWeek.friday)
                        }
                        Group {
                            HStack {
                                Text("Sábado")
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(Date().dayNumberOfTheWeek() == K.daysOfTheWeek[6].dayNumber ? .orange : .white)
                                    .padding(.horizontal)
                                    .padding(.vertical, 4)
                                Spacer()
                            }
                            DayActivities(testWeek.saturday)
                        }
                    }
                }
            }
        }
    }
}

struct DayActivities: View {
    let day: Day
    
    init(_ day: Day) {
        self.day = day
    }
    
    var body: some View {
        VStack {
            if day.activities.count == 0 {
                WeekDetailCellEmptyVertical()
            }
            else if day.activities.count < 2 {
                WeekDetailCell(day.activities[0])
                    .cornerRadius(24)
                WeekDetailCellEmptyHorizontal()
            }
            else {
                WeekDetailCell(day.activities[0])
                    .cornerRadius(24)
                WeekDetailCell(day.activities[1])
                    .cornerRadius(24)
            }
        }
    }
    
    
}

struct WeekDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeekDetailView(viewRouter: ViewRouter())
    }
}
