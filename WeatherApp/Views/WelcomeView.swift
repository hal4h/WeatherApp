//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Halah Mhanni on 2022-04-03.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View{
    @EnvironmentObject var locationManager: LocationManager

    var body: some View{
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)
                Text("Allow location sharing to get the weather in your area :D")
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)  // takes up whole screen
    }

}









struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
