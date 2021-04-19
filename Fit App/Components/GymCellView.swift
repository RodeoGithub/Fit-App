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
                        .padding(.vertical,8)
                    HStack {
                        GymProximityView(proximity: gym.proximity)
                            .foregroundColor(.black)
                        Spacer()
                        if condition {
                            Text("ABIERTO")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                        else {
                            Text("CERRADO")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                        }
                    }
                }
            }.padding([.trailing,.vertical])
        }
        .cornerRadius(12)
        .shadow(radius: 10)
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
    //@State var unit: String = "m"
    var unit: String {
        if proximity >= 1000 {
            return "Km"
        }
        else {
            return "m"
        }
    }
    
    var body: some View {
        HStack {
            //Image(systemName: "location")
            
            if proximity >= 1000 {
                Label("\(String(round(10*((Float(proximity)/1000)))/10)) \(unit)", systemImage: "location")
                    .font(.footnote)
//                Text("\(String(round(10*((Float(proximity)/1000)))/10)) \(unit)")
//                    .foregroundColor(.black)
//                    .font(.footnote)
            }
            else {
                Label("\(String(proximity)) \(unit)", systemImage: "location")
                    .font(.footnote)
//                Text("\(String(proximity)) \(unit)")
//                    .foregroundColor(.black)
//                    .font(.footnote)
            }
        }
    }
    
    func foregroundColor(_ color: Color) -> some View {
        return body.foregroundColor(color)
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
