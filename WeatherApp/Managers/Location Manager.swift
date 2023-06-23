//
//  Location Manager.swift
//  WeatherApp
//
//  Created by Halah Mhanni on 2022-04-03.
//

//import SwiftUI
import Foundation
import CoreLocation     // framework from apple to get users location

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    
// creates an instance of CLLocationManager, the framework we use to get the coordinates
let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false  // loading screen
    
    override init(){
        super.init()
        manager.delegate = self
        // Assigning a delegate to our CLLocationManager instance
    }// end init()
    
    // Requests the one-time delivery of the user’s current location, https://developer.apple.com/documentation/corelocation/cllocationmanager/1620548-requestlocation
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }// end requestLocation
    
    // Set the location coordinates to the location variable
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { // array of CLLocations
        location = locations.first?.coordinate
        isLoading = false
    }// endlocationmanager
    
    // This function will be called if we run into an error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Error getting location", error)
        isLoading = false;
    }// endlocationmanager
    
    
}// end class
