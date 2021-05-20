//
//  ContentView.swift
//  SliwinskaWeatherApp
//
//  Created by Użytkownik Gość on 06/05/2021.

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        // Możliwoś przewijania widoku
        ScrollView(.vertical) {
            // Wertykalna struktura rekordów
            VStack {
                ForEach(viewModel.records) {record in
                    WeatherRecordView(viewModel: viewModel, record: record)
                }
            }.padding()
        }
    }
}

struct WeatherRecordView: View {
    var viewModel: WeatherViewModel
    var record: WeatherModel.WeatherRecord
    
    var body: some View {
        // Kontener na rekord
        ZStack{
            // zaokrąglony prostokąt
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .stroke()
            // Horyzontalna struktura elementów
            HStack{
                // Ikonka pogody pobierana ze slownika zabezpieczona przed zwróceniem wartości null
                if let notNullIcon = viewModel.iconsDict[record.WeatherState] {
                    // Dostosowanie do przydzielonego miejsca
                    GeometryReader {geometry in
                            Text("\(notNullIcon)")
                                // Dostowanie wielkości ikony do dostępnego miejsca
                                .font(.system(size: 0.9 * geometry.size.height))
                                .frame(width: geometry.size.width * 0.5)
                    }
                } else {
                    // Dostosowanie do przydzielonego miejsca
                    GeometryReader {geometry in
                                Text("❎")
                                    // Dostosowanie wielkości ikony do dostępnego miejsca
                                    .font(.system(size: 0.9 * geometry.size.height))
                                    .frame(width: geometry.size.width * 0.5)
                        }
                }
                // Wertykalne uporządkowanie tekstów
              VStack(alignment: .leading) {
                // Nazwa miasta
                Text(record.cityName)
                // Zwrócone przed odpowiednie funkcje: nazwa i wartośc wybranego parametru
                Text("\(viewModel.currentParamNameText(record: record))  \(viewModel.currentParam(record: record), specifier: "%.1f")")
                    .font(.caption)
                    // Przy kliknięciu wywoanie funkcji zmieniającej wybrany parametr
                    .onTapGesture {
                        viewModel.nextParam(record: record)
                    }
                }
                // Ikonka odświeżania
               Text("🔁")
                    .font(.largeTitle)
                    // Wysyanie funkcji odświeżania
                    .onTapGesture {
                        viewModel.refresh(record: record)
                    }
                }
            // Wysokośc niezależna od liczby elementów
            .frame(height: 60.0)        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel())
    }
}

