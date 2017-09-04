//
//  MapViewController.swift
//  OnTheMapV.2
//
//  Created by Benjamin Odisho on 9/2/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshView()
    }
    
    // Determines View For Pins
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    // This delegate method is implemented to respond to taps. It opens the system browser
    // to the URL specified in the annotationViews subtitle property.
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            let app = UIApplication.shared
            if let toOpen = view.annotation?.subtitle! {
                app.openURL(URL(string: toOpen)!)
            }
        }
    }
   
    // Function to refresh locations found.
    func refreshView() {
        
        ParseClient.sharedInstance().getStudentLocations { success in
            
            var annotations = [MKPointAnnotation]()
            for studentLocation in StudentLocations.sharedInstance().locations {
                
                // Notice that the float values are being used to create CLLocationDegree values.
                // This is a version of the Double type.
                let lat = CLLocationDegrees(studentLocation.latitude)
                let long = CLLocationDegrees(studentLocation.longitude)
                
                // The lat and long are used to create a CLLocationCoordinates2D instance.
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                
                // Here we create the annotation and set its coordiate, title, and subtitle properties
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = "\(studentLocation.firstName) \(studentLocation.lastName)"
                annotation.subtitle = studentLocation.mediaURL
                
                // Finally we place the annotation in an array of annotations.
                annotations.append(annotation)
                performUIUpdatesOnMain {
                    self.mapView.addAnnotations(annotations)
                }
            }
            
        }
    }

}
