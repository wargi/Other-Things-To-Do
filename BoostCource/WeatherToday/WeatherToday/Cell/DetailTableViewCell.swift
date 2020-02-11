//
//  DetailTableViewCell.swift
//  WeatherToday
//
//  Created by 박상욱 on 06/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
   //MARK:- Properties
   static let identifier = "DetailTableViewCell"
   @IBOutlet private weak var cityLabel : UILabel!
   @IBOutlet private weak var CFLabel : UILabel!
   @IBOutlet private weak var rainfallLabel : UILabel!
   @IBOutlet private weak var weatherImageView : UIImageView!
   var city: WeatherCity?
   
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   //MARK:- Oulet Update
   func configure(info: WeatherCity) {
      self.city = info
      
      let fahrenheit = String(format: "%.1f", WeatherData.shared.celsiusToFahrenheit(celsius: info.celsius))
      
      self.cityLabel.text = info.name
      self.CFLabel.text = "섭씨 \(info.celsius)도 / 화씨 \(fahrenheit)도"
      self.CFLabel.textColor = WeatherData.shared.temperature(celsius: info.celsius)
      self.rainfallLabel.text = "강수확율 \(info.rainfall)%"
      self.rainfallLabel.textColor = WeatherData.shared.rainyfall(probability: info.rainfall)
      self.weatherImageView.image = UIImage(named: "\(info.state)")
   }
}
