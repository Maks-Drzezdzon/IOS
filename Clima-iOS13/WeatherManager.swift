//
//  WeatherManager.swift
//  Clima
//
//  Created by Maks Drzezdzon on 23/11/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURl="https://samples.openweathermap.org/data/2.5/weather?appid=b6907d289e10d714a6e88b30761fae22&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURl)&q=\(cityName)"
        print(urlString)
    }
}
