//
//  Weather.swift
//  WeatherToday
//
//  Created by 박상욱 on 06/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Codable
struct WeatherCountry: Decodable {
   let countryName: String
   let assetName: String
   
   private enum CodingKeys: String, CodingKey {
      case countryName = "korean_name"
      case assetName = "asset_name"
   }
}

struct WeatherCity: Decodable {
   let name: String
   let state: Int
   let celsius: Double
   let rainfall: Int
   
   private enum CodingKeys: String, CodingKey {
      case name = "city_name"
      case state = "state"
      case celsius = "celsius"
      case rainfall = "rainfall_probability"
   }
}

//MARK:- Weather Data
struct Weather {
   let country: WeatherCountry // 국가 정보 (나라명, 국기명)
   let cities: [WeatherCity] // 도시 정보 배열
}

class WeatherData {
   static let shared = WeatherData()
   var weatherData = [Weather]()
   
   private init() {}
   
   // Data Load
   func fetch() {
      let jsonDecoder = JSONDecoder()
      var counties = [WeatherCountry]()
      // 국가 정보
      guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else { return }
      
      do {
         counties = try jsonDecoder.decode([WeatherCountry].self, from: dataAsset.data)
      } catch {
         print(error.localizedDescription)
      }
      // 각 국가별 도시 정보
      for country in counties {
         guard let dataAsset = NSDataAsset(name: country.assetName) else { return }
         do {
            let cities = try jsonDecoder.decode([WeatherCity].self, from: dataAsset.data)
            weatherData.append(Weather(country: country, cities: cities))
         } catch {
            print(error.localizedDescription)
         }
      }
   }
   
   // 섭씨 -> 화씨 변환
   func celsiusToFahrenheit(celsius: Double) -> Double {
      return celsius * 1.8 + 32
   }
   
   // 날씨 상태(Int -> String)
   func weatherState(state: Int) -> String {
      switch state {
      case 10:
         return "맑음"
      case 11:
         return "흐림"
      case 12:
         return "비"
      default:
         return "눈"
      }
   }
   
   func temperature(celsius: Double) -> UIColor {
      if celsius < 10 {
         return .blue
      } else if celsius < 20 {
         return .black
      } else {
         return .red
      }
   }
   
   func rainyfall(probability: Int) -> UIColor {
      if probability < 60 {
         return .black
      } else {
         return .orange
      }
   }
}
