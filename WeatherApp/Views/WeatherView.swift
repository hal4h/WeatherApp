//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Halah Mhanni on 2022-04-14.
import Foundation
import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
    
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)  //calls preview data
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))").fontWeight(.light)
                    }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud.snow").font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "").font(.system(size: 100)).fontWeight(.bold).padding()
                        
                    }
                    Spacer()
                        .frame(height: 80)

                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {        //what user sees when data is beign downloaded
                        ProgressView()
                    }
                        Spacer()
                }
                    
                    .frame(maxWidth: .infinity)
                    
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather now").bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo:"thermometer", name: "Min temp", value:(weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo:"thermometer", name: "Max temp", value:(weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo:"wind", name: "Wind Speed", value:(weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo:"humidity", name: "Humidity", value:(weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom,20).foregroundColor(Color(hue: 0.638, saturation: 0.748, brightness: 0.342)).background(.white).cornerRadius(20, corners: [.topLeft, .topRight])
            }
                    
         
        }
        .edgesIgnoringSafeArea(.bottom)//make sure background covers all areas
        .background(Color(hue: 0.638, saturation: 0.748, brightness: 0.342)).preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
