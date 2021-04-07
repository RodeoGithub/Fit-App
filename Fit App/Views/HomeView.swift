//
//  HomeView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 23/03/2021.
//

import SwiftUI
import CoreLocation
import Mapbox
import MapboxSearch

struct HomeView: View {
    @EnvironmentObject var env: AppEnviromentData
    
    @ObservedObject private var locationManager = LocationManager()
    @State private var isInitialized = true
    @State private var annotations: [MGLPointAnnotation] = [
        MGLPointAnnotation(title: "Gym1", coordinate: .init(latitude: -27.4495, longitude: -59.0205)),
        MGLPointAnnotation(title: "Gym2", coordinate: .init(latitude: -27.45202, longitude: -59.02103))]
    
    @StateObject var viewRouter: ViewRouter
    
    @State var isGymListPresented = false
    private let defaultLocation = CLLocationCoordinate2D(latitude: -34.6083, longitude: -58.3712) // Ciudad de Buenos Aires
    let engine = SearchEngine()
    
    var body: some View {
        let map = MapView(annotations: $annotations)
        ZStack {
            Color(K.Colors.gray15).ignoresSafeArea()
            GeometryReader { geometry in
                map
                    .userTrackingMode(.follow)
                    .zoomLevel(15)
                    .centerCoordinate(defaultLocation)
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
                                    ProfilePhotoView(imageName: "logo", points: 4)
                                        .padding()
                                }
                            }.frame(width: geometry.size.width, height: 200, alignment: .center)
                            WeekView()
                                .offset(y: -60)
                        }
                    }
                }
                Spacer()
                HStack{
                    Spacer()
                    VStack {
                        Button(action:{
                            withAnimation{
                                isGymListPresented.toggle()
                            }
                        }) {
                            Image(systemName: "list.bullet")
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 60, height: 60)
                        .background(K.Colors.defaultGradient)
                        .cornerRadius(35)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                        
                        Button(action:{
                            map.refreshMapCenter()
                        }) {
                            Image(systemName: "location")
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 60, height: 60)
                        .background(K.Colors.defaultGradient)
                        .cornerRadius(35)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                    }
                }
            }
        }.ignoresSafeArea(edges: .vertical)
        .onAppear(perform: startUpdatingLocation)
        
        .sheet(isPresented: $isGymListPresented) {
            GymListView()
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
