//  GymDetailView.swift

import SwiftUI

struct GymDetailView: View {
    let gym: Gym
    let screenWidth = UIScreen.main.bounds.width
    init(gym: Gym) {
        self.gym = gym
    }
    
    @State var imageSelected = 0
    
    @State var gymShift = testGymShift
    @State var poolShift = testPoolShift
    @State var lessonShift = testLessonShift
    
    var body: some View {
        ZStack(alignment: .top){
            ScrollView {
                VStack {
                    GymImageScroll(gym: gym, imageSelected: $imageSelected)
                        .frame(width: screenWidth, height: 300)
                    GymWorkTimeView(openTime: gym.openTime, closeTime: gym.closeTime)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(12)
                    if let activities = gym.activities {
                        if activities.contains(.Gym) {
                            ShiftListView(type: .Gym, $gymShift)
                                .padding(.horizontal,16)
                                .padding(.vertical, 8)
                        }
                        if activities.contains(.Pool) {
                            ShiftListView(type: .Pool, $poolShift)
                                .padding(.horizontal,16)
                                .padding(.vertical, 8)
                        }
                        if activities.contains(.Lesson) {
                            ShiftListView(type: .Lesson, $lessonShift)
                                .padding(.horizontal,16)
                                .padding(.vertical, 8)
                        }
                    }
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
        .navigationBarColor(.orange)
    }
}

struct GymImageScroll: View {
    let gym: Gym
    
    @Binding var imageSelected: Int
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $imageSelected) {
                ForEach(gym.images ?? [GymImage("photo")]) { image in
                    Image(image.name)
                        .resizable()
                        .scaledToFill()
                }.brightness(-0.2)
            }.tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            VStack {
                HStack  {
                    Text("\(gym.condition ? "ABIERTO" : "CERRADO")")
                        .foregroundColor(gym.condition ? .green : .red).padding()
                    Spacer()
                    GymProximityView(proximity: gym.proximity)
                        .foregroundColor(.white).padding()
                }.padding()
                HStack {
                    Spacer()
                    VStack {
                        Text("\(gym.title)")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        Text("\(gym.address)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ShiftListView: View {
    let type: ActivityType
    var color: Color
    var title: String
    
    @State var selectedDay = Date().dayNumberOfTheWeek() ?? 0
    
    @Binding var shiftArray: [Shift]
    
    init(type: ActivityType, _ shiftArray: Binding<[Shift]>) {
        self.type = type
        self._shiftArray = shiftArray
        switch type {
        case .Gym:
            color = .orange
            title = "Gimnasio"
        case .Pool:
            color = .blue
            title = "Pileta"
        case .Lesson:
            color = .green
            title = "Clases"
        }
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .bold()
                .italic()
                .foregroundColor(.white)
                .padding(12)
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(color)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 6, idealHeight: 6, maxHeight: 6, alignment: .center)
                .padding(.horizontal, 16)
                .padding(.vertical, 2)
            
            HStack {
                ForEach (K.daysOfTheWeek) { day in
                    ZStack {
                        if selectedDay == day.dayNumber {
                            Circle().fill(K.Colors.defaultGradient)
                        }
                        if Date().dayNumberOfTheWeek() == day.dayNumber { // Is today
                            Button(action: {
                                withAnimation {
                                    selectedDay = day.dayNumber
                                }
                            }, label: {
                                if selectedDay == day.dayNumber {
                                    Text(day.shortName)
                                        .font(.system(size:20))
                                        .minimumScaleFactor(0.001)
                                        .foregroundColor(.white)
                                }
                                else {
                                    Text(day.shortName)
                                        .font(.system(size: 16))
                                        .minimumScaleFactor(0.001)
                                        .foregroundColor(.orange)
                                }
                            })
                        }
                        
                        else { // Is not today
                            Button(action: {
                                withAnimation {
                                    selectedDay = day.dayNumber
                                }
                            }, label: {
                                if selectedDay == day.dayNumber {
                                    Text(day.shortName)
                                        .font(.system(size:20))
                                        .minimumScaleFactor(0.001)
                                        .foregroundColor(.white)
                                }
                                else {
                                    Text(day.shortName)
                                        .font(.system(size: 16))
                                        .minimumScaleFactor(0.001)
                                        .foregroundColor(.white)
                                }
                            })
                        }
                    }
                    /*
                    
                        Button(action: {
                            withAnimation {
                                selectedDay = day.dayNumber
                            }
                        }, label: {
                            if selectedDay == day.dayNumber {
                                Text(day.shortName)
                                    .font(.system(size:20))
                                    .minimumScaleFactor(0.0001)
                                    .foregroundColor(.white)
                                    .background(K.Colors.defaultGradient)
                                    .cornerRadius(24)
                            }
                            else {
                                Text(day.shortName)
                                    .font(.system(size: 20))
                                    .minimumScaleFactor(0.0001)
                                    .foregroundColor(.orange)
                                
                            }
                        }).padding(4)
                    }
                    else {
                        Button(action: {
                            withAnimation {
                                selectedDay = day.dayNumber
                            }
                        }, label: {
                            if selectedDay == day.dayNumber {
                                Text(day.shortName)
                                    .font(.system(size:20))
                                    .minimumScaleFactor(0.0001)
                                    .foregroundColor(.white)
                                    .background(K.Colors.defaultGradient)
                                    .cornerRadius(24)
                            }
                            else {
                                Text(day.shortName)
                                    .font(.system(size:20))
                                    .minimumScaleFactor(0.0001)
                                    .foregroundColor(.white)
                                
                            }
                        }).padding(4)
                    }*/
                }
            }.frame(minHeight: 36)
            .padding(.horizontal, 12)
            .padding(.vertical,2)
            
            VStack {
                ForEach(shiftArray) { shift in
                    ShiftCellView(shift: shift)
                        .padding(.vertical, 1)
                        .padding(.horizontal, 12)
                }
            }
        }.padding(.horizontal, 8)
        .padding(.vertical, 8)
        .background(Color(K.Colors.gray17))
        .cornerRadius(16)
    }
}

struct ShiftCellView: View {
    let shift: Shift
    @State var isExpanded: Bool = false
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(shift.place)
                    .foregroundColor(.white)
                Spacer()
                Text("\(shift.startTime) - \(shift.endTime)")
                    .foregroundColor(.white)
                Spacer()
                Label("\(shift.maxCapacity)", systemImage: "person")
                    .foregroundColor(.white)
                    .padding(8)
                    .background(K.Colors.defaultGradient)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                Spacer()
            }
            
            if isExpanded {
                RoundedButton(text: "Reservar", withGradient: K.Colors.defaultGradient, foregroundColor: .white) {
                    //Reservar
                }
            }
        }.padding(8)
        .background(Color(K.Colors.gray27))
        .cornerRadius(16)
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
}

struct GymDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GymDetailView(gym: gymTestList[0])
    }
}
