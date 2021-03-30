//
//  MapView.swift
//  Fit App
//
//  Created by Rodrigo Maidana on 24/03/2021.
//

import SwiftUI
import UIKit
import Mapbox
import MapboxSearch

extension MGLPointAnnotation {
    convenience init(title: String, coordinate: CLLocationCoordinate2D) {
        self.init()
        self.title = title
        self.coordinate = coordinate
    }
}

struct MapView: UIViewRepresentable {
    
    private let mapView = MGLMapView(frame: .zero, styleURL: MGLStyle.streetsStyleURL)
    
    @Binding var annotations: [MGLPointAnnotation]

    private func updateAnnotations() {
        if let currentAnnotations = mapView.annotations {
            mapView.removeAnnotations(currentAnnotations)
        }
        mapView.addAnnotations(annotations)
    }
    
    func makeUIView(context: Context) -> MGLMapView {
        
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //searchGyms()
        return mapView
    }

    func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations()
    }

    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self)
    }
    func styleURL(_ styleURL: URL) -> MapView {
        mapView.styleURL = styleURL
        return self
    }
    
    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapView {
        mapView.centerCoordinate = centerCoordinate
        return self
    }
    
    func zoomLevel(_ zoomLevel: Double) -> MapView {
        mapView.zoomLevel = zoomLevel
        return self
    }
    
    func userTrackingMode(_ userTrackingMode: MGLUserTrackingMode) -> MapView {
        mapView.userTrackingMode = userTrackingMode
        return self
    }
    
    func refreshMapCenter() {
        if let userLocation = mapView.userLocation?.coordinate {
            mapView.setCenter(userLocation, zoomLevel: 15, animated: true)
        }
    }
    
    // MARK:- Coordinator
    
    final class Coordinator: NSObject, MGLMapViewDelegate {
        var control: MapView

        init(_ control: MapView) {
            self.control = control
        }

        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }

        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }
    }
    
    // MARK:- Search
    
    func searchGyms(){
        let searchEngine = CategorySearchEngine()
        searchEngine.search(categoryName: "cafe", options: SearchOptions(proximity: CLLocationCoordinate2D(latitude: 37.7911551, longitude: 32.3966103))) { (response) in
            do {
                let results = try response.get()
                for result in results {
                    //testing
                    print(result.coordinate)
                    print(result.name)
                }
            }
            catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
