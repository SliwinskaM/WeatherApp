//
//  WeatherViewModel.swift
//  SliwinskaWeatherApp
//
//  Created by Użytkownik Gość on 06/05/2021.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published private(set) var model: WeatherModel = WeatherModel(cities: ["Venice", "Paris", "Warsaw", "Hamburg", "Ilava", "Krakow", "Milan", "Helsinki", "Berlin"])

    
    var records: Array<WeatherModel.WeatherRecord> {
        model.records
    }
    
    var iconsDict: Dictionary<String, String> {
        model.iconsDict
    }
    
    func refresh(record: WeatherModel.WeatherRecord) {
        model.refresh(record: record)
    }
    
    func nextParam(record: WeatherModel.WeatherRecord) {
        model.nextParam(record: record)
    }
    
    func currentParamNameText(record: WeatherModel.WeatherRecord) -> String {
        return model.currentParamNameText(record: record)
    }
    
    func currentParam(record: WeatherModel.WeatherRecord) -> Float {
        return model.currentParam(record: record)
    }
    
}
