//
//  MapViewController.swift
//  coupePizzaGateau
//
//  Created by laurent on 04/02/2015.
//  Copyright (c) 2015 fenyouse. All rights reserved.
//
import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var TheMap: MKMapView!
    
    var manager:CLLocationManager!
    var myLocations: [CLLocation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup our Location Manager
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
        //Setup our Map View
        TheMap.delegate = self
        TheMap.mapType = MKMapType.Hybrid
        TheMap.showsUserLocation = true
        
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        myLocations.append(locations[0] as CLLocation)
        let spanX = 0.007
        let spanY = 0.007
        var newRegion = MKCoordinateRegion(center: TheMap.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        TheMap.setRegion(newRegion, animated: true)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

