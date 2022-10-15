//
//  MapView.swift
//  SDO
//
//  Created by Joel Kingsley on 07/10/2022.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var places: [GetChannelsData.ChannelData]
    
    // Create the MKMapView using UIKit
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.region = region
        places.forEach { place in
            let point = MKPointAnnotation()
            point.coordinate = place.coordinate
            if let title = place.title {
                point.title = title
            }
            mapView.addAnnotation(point)
        }
        return mapView
    }
    
    // Updates map when binding variable changes
    func updateUIView(_ view: MKMapView, context: Context) {
        view.delegate = context.coordinator
        view.setRegion(region, animated: true)
    }
    
    // Link it to the coordinator which is defined below.
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }

}
