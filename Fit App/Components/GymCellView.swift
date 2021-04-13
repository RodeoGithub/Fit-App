//  GymCellView.swift

import SwiftUI

struct GymCellView: View {
    
    let gym: Gym
    
    @State var condition: Bool = false
    
    init(gym: Gym) {
        self.gym = gym
    }
    
    var body: some View {
        ZStack {
            Color.white
            HStack {
                Image(gym.imageName)
                    .padding()
                VStack(alignment: .leading){
                    Text(gym.title)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                    Text(gym.address)
                        .font(.subheadline)
                    Spacer()
                    GymWorkTimeView(openTime: gym.openTime, closeTime: gym.closeTime)
                    HStack {
                        GymProximityView(proximity: gym.proximity)
                        Spacer()
                        if condition {
                            Text("ABIERTO")
                                .font(.footnote)
                                .foregroundColor(.green)
                        }
                        else {
                            Text("CERRADO")
                                .font(.footnote)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }.cornerRadius(12)
        .shadow(radius: 5)
        .onAppear(perform: setStatus)
    }
    
    func setStatus() {
        self.condition = gym.condition
    }
}

struct GymWorkTimeView: View {
    let openTime: String
    let closeTime: String
    
    var body: some View {
        HStack {
            Image(systemName: "clock")
            Text("\(openTime) - \(closeTime)")
                .foregroundColor(.black)
                .font(.footnote)
        }
    }
}

struct GymProximityView: View {
    let proximity: Int
    @State var unit: String = "m"
    @State var currentUnit = ""
    
    var body: some View {
        HStack {
            Image(systemName: "location")
            
            if proximity >= 1000 {
                Text("\(String(round(10*((Float(proximity)/1000)))/10)) \(unit)")
                    .foregroundColor(.black)
                    .font(.footnote)
            }
            else {
                Text("\(String(proximity)) \(unit)")
                    .foregroundColor(.black)
                    .font(.footnote)
            }
        }.onAppear(perform: updateUnit)
    }
    func updateUnit() {
        if proximity >= 1000 {
            self.unit = "Km"
        }
        else {
            self.unit = "m"
        }
    }
}

struct GymPlaceView: View {
    
    let place: String
    let type: ActivityType
    
    init(at place: String, ofType type: ActivityType){
        self.place = place
        self.type = type
    }
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(place)
                .foregroundColor(.black)
                .font(.footnote)
        }
    }
}

struct GymCellView_Previews: PreviewProvider {
    static var previews: some View {
        GymCellView(gym: gymTestList[0])
    }
}
