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
    
    let searchEngine = SearchEngine()
    
    private func updateAnnotations() {
        if let currentAnnotations = mapView.annotations {
            mapView.removeAnnotations(currentAnnotations)
        }
        mapView.addAnnotations(annotations)
    }
    
    func makeUIView(context: Context) -> MGLMapView {
        
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        searchEngine.delegate = context.coordinator
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
    
    final class Coordinator: NSObject, MGLMapViewDelegate, SearchEngineDelegate {
        var control: MapView
        
        init(_ control: MapView) {
            self.control = control
        }
        
        
        func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
                //
        }

        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }

        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }
        
        //MARK: - Search Delegate
        func resultsUpdated(searchEngine: SearchEngine) {
            print("Number of search results: \(searchEngine.items.count)")
            
            /// Simulate user selection with random algorithm
            guard let randomSuggestion: SearchSuggestion = searchEngine.items.randomElement() else {
                print("No available suggestions to select")
                return
            }
            
            /// Callback to SearchEngine with choosen `SearchSuggestion`
            searchEngine.select(suggestion: randomSuggestion)
            
            /// We may expect `resolvedResult(result:)` to be called next
            /// or the new round of `resultsUpdated(searchEngine:)` in case if randomSuggestion represents category suggestion (like a 'bar' or 'cafe')
        }
        
        func resolvedResult(result: SearchResult) {
            /// WooHoo, we retrieved the resolved `SearchResult`
            print("Resolved result: coordinate: \(result.coordinate), address: \(result.address?.formattedAddress(style: .medium) ?? "N/A")")
            
            print("Dumping resolved result:", dump(result))
            
        }
        
        func searchErrorHappened(searchError: SearchError) {
            print("Error during search: \(searchError)")
        }
    }
    
}


