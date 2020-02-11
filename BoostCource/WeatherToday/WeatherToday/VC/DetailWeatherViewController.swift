//
//  DetailWeatherViewController.swift
//  WeatherToday
//
//  Created by 박상욱 on 06/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {
   //MARK:- Properties
   @IBOutlet private weak var weatherLabel : UILabel!
   @IBOutlet private weak var CFLabel : UILabel!
   @IBOutlet private weak var rainfallLabel : UILabel!
   @IBOutlet private weak var weatherImageView : UIImageView!
   var city: WeatherCity? // 해당 도시 정보
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.navigationItem.title = city?.name
      configure() // oulet 설정
   }
   
   //MARK:- Oulet Update
   func configure() {
      guard let info = city else { return }
      let fahrenheit = String(format: "%.1f", WeatherData.shared.celsiusToFahrenheit(celsius: info.celsius))
      
      self.CFLabel.text = "섭씨 \(info.celsius)도 / 화씨 \(fahrenheit)도"
      self.CFLabel.textColor = WeatherData.shared.temperature(celsius: info.celsius)
      self.weatherLabel.text = WeatherData.shared.weatherState(state: info.state)
      self.rainfallLabel.text = "강수확율 \(info.rainfall)%"
      self.rainfallLabel.textColor = WeatherData.shared.rainyfall(probability: info.rainfall)
      self.weatherImageView.image = UIImage(named: "\(info.state)")
   }
}
