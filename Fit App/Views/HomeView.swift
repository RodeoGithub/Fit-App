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
    
    @ObservedObject private var locationManager = LocationManager()
    
    @State private var annotations: [MGLPointAnnotation] = []
    private let defaultLocation = CLLocationCoordinate2D(latitude: -34.6083, longitude: -58.3712) // Ciudad de Buenos Aires
    let engine = SearchEngine()
    init() {
        locationManager.startUpdating()
    }
    
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
                                .offset(y: -50)
                        }
                    }
                }
                Spacer()
                HStack{
                    Spacer()
                    Button(action:{
                        map.refreshMapCenter()
                        map.searchGyms()
                    }) {
                        Image(systemName: "location")
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor(.white)
                    }
                    .frame(width: 70, height: 70)
                    .background(K.Colors.defaultGradient)
                    .cornerRadius(35)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                }
            }
        }.ignoresSafeArea(edges: .vertical)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
