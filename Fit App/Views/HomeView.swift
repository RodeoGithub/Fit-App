//  HomeView.swift

import SwiftUI
import CoreLocation
import Mapbox
import MapboxSearch

struct HomeView: View {
    @EnvironmentObject var env: AppEnviromentData
    @ObservedObject private var locationManager = LocationManager()
    
    @State private var isFirstUpdate = true
    
    @State private var isInitialized = true
    @State private var annotations: [MGLPointAnnotation] = [
        MGLPointAnnotation(title: "Gym1", coordinate: .init(latitude: -27.4495, longitude: -59.0205)),
        MGLPointAnnotation(title: "Gym2", coordinate: .init(latitude: -27.45202, longitude: -59.02103))]
    
    @StateObject var viewRouter: ViewRouter
    
    @State private var isGymListPresented = false
    private let defaultLocation = CLLocationCoordinate2D(latitude: -34.6083, longitude: -58.3712) // Ciudad de Buenos Aires
    
    var body: some View {
        let map = MapView(annotations: $annotations)
        ZStack {
            Color(K.Colors.gray15).ignoresSafeArea()
            GeometryReader { geometry in
                map
                    .userTrackingMode(.follow)
                    .zoomLevel(15)
                    .centerCoordinate(locationManager.lastKnownLocation?.coordinate ?? defaultLocation)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
            VStack {
                ZStack {
                    GeometryReader { geometry in
                        VStack {
                            ZStack{
                                RadialGradient(gradient: Gradient(colors: [Color(K.Colors.lightGrayColor), Color(K.Colors.gray15)]), center: .top, startRadius: 10, endRadius: 160)
                                HStack(alignment: .top){
                                    Image("full-logo")
                                        .resizable()
                                        .frame(width: 149, height: 72)
                                        .padding()
                                    Spacer()
                                    ProfilePhotoView(imageName: "profile-photo", points: 4)
                                        .padding()
                                }
                            }.frame(width: geometry.size.width, height: 200, alignment: .center)
                            WeekView(viewRouter: viewRouter, withDetail: false)
                                .offset(y: -60)
                                .shadow(radius: 10)
                        }
                    }
                }
                
                VStack {
                    HStack{
                        Spacer()
                        VStack {
                            Button(action:{
                                withAnimation{
                                    isGymListPresented.toggle()
                                }
                            }) {
                                Image(systemName: "list.bullet")
                                    .foregroundColor(.white)
                            }
                            .frame(width: 30, height: 30)
                            
                            Button(action:{
                                map.refreshMapCenter()
                            }) {
                                Image(systemName: "location")
                                    .foregroundColor(.white)
                            }
                            .frame(width: 30, height: 30)
                            .shadow(color: Color.black.opacity(0.3),
                                    radius: 3,
                                    x: 3,
                                    y: 3)
                            
                        }.padding(8)
                        .background(Color(K.Colors.gray19))
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                        .cornerRadius(12)
                        .offset(y:-80)
                    }.padding()
                    
                    Spacer()
                    
                }
            }
        }.ignoresSafeArea(edges: .vertical)
        .onAppear(perform: startUpdatingLocation)
        .sheet(isPresented: $isGymListPresented) {
            GymListView()
        }
        .onReceive(locationManager.didChange) { v in
            if isFirstUpdate {
                map.refreshMapCenter()
                self.isFirstUpdate = false
            }
        }
    }
    
    private func startUpdatingLocation() {
        locationManager.startUpdating()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewRouter: ViewRouter())
    }
}
