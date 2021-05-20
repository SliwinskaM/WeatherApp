//
//  WeatherModel.swift
//  SliwinskaWeatherApp
//
//  Created by Użytkownik Gość on 06/05/2021.
//

import Foundation

struct WeatherModel {
    var records: Array<WeatherRecord>
    
    var iconsDict = ["Snow": "🌨",  "Thunderstorm": "🌩", "Rain": "🌧",  "Showers": "🌦", "Heavy Cloud": "☁️", "Light Cloud": "⛅️", "Clear": "☀️"]

    
    init(cities: Array<String>) {
        records = Array<WeatherRecord>()
        for city in cities {
            records.append(WeatherRecord(cityName: city))
        }
    }
    
    struct WeatherRecord: Identifiable {
        var id: UUID = UUID()
        var cityName: String
        var WeatherState: String = "Clear"
        var temperature: Float = Float.random(in: -15.0 ... 30.0)
        var humidity: Float = Float.random(in: 20.0 ... 90.0)
        var windSpeed: Float = Float.random(in: 0.0 ... 30.0)
        var windDirection: Float = Float.random(in: 0.0 ..< 365.0)
        var currentParamIdx: Int = 0
    }
    
    mutating func refresh(record: WeatherRecord) {
        if let index = records.firstIndex(where: {$0.id == record.id}) {
            records[index].temperature = Float.random(in: 0.0 ... 60.0)
            print("Refresihng")
        }
    }
    
    mutating func nextParam(record: WeatherRecord) {
        if let index = records.firstIndex(where: {$0.id == record.id}) {
            if records[index].currentParamIdx < 3 {
                records[index].currentParamIdx += 1
            } else {
                records[index].currentParamIdx = 0
            }
            print("Changing parameter")
        }
    }
    
    func currentParamNameText(record: WeatherRecord) -> String {
        switch record.currentParamIdx {
        case 0:
            return "Temperature [℃] "
        case 1:
            return "Humidity: "
        case 2:
            return "Wind Speed: "
        case 3:
            return "Wind Direction: "
        default:
            return "Default"
        }
    }
    
    func currentParam(record: WeatherRecord) -> Float {
        switch record.currentParamIdx {
        case 0:
            return record.temperature
        case 1:
            return record.humidity
        case 2:
            return record.windSpeed
        case 3:
            return record.windDirection
        default:
            return 0.0
        }
    }}
