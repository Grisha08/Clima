//
//  WeatherManager.swift
//  Clima
//
//  Created by Grisha Borodavka on 06/12/2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation



protocol  WeatherManagerDelegate {
    func didUpdateWeather(weather:WeatherModel)
  
}
struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b6a3377061d875d3075dab561615c957&units=metric"
    
    var delegate  : WeatherManagerDelegate?
    
    func fetchWeather (cityName: String ){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performReguest(urlString: urlString)
    }
    func fetchWeather (latitude: CLLocationDegrees,longitude: CLLocationDegrees ){
        
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
       performReguest(urlString: urlString)
    }
    
    func performReguest(urlString: String){
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                if let safeData = data {
                    if  let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather( weather:weather)
                    }
                 
                }
            }
            task.resume()
        }
    }
    func parseJSON(weatherData : Data)-> WeatherModel?{
        
        let decoder = JSONDecoder()
        do{
          let decodeData =  try  decoder.decode(WeatherData.self, from: weatherData)
         let id = decodeData.weather[0].id
            let name = decodeData.name
            let temp = decodeData.main.temp
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        }
        catch{
           
            return nil
           
        }
    }
    
    

}









