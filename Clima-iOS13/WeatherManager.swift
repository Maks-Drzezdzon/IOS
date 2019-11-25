//
//  WeatherManager.swift
//  Clima
//
//  Created by Maks Drzezdzon on 23/11/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURl = "https://api.openweathermap.org/data/2.5/weather?APPID=df9cc11779f18f051a21390585e284f2&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //create url
        if let url = URL(string: urlString){
            
            // create session
            let session = URLSession(configuration: .default)
            
            // assign task to session
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
        
    }
    
}
