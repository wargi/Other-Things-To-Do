//
//  MainTableViewCell.swift
//  WeatherToday
//
//  Created by 박상욱 on 06/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
   //MARK:- Properties
   static let identifier = "MainTableViewCell"
   @IBOutlet private weak var countryImageView : UIImageView!
   @IBOutlet private weak var countryLabel : UILabel!
   var country: Weather?
   
   override func awakeFromNib() {
      super.awakeFromNib()
   }
   
   //MARK:- Oulet Update
   func configure(info: Weather) {
      self.country = info
      
      self.countryImageView.image = UIImage(named: "flag_\(info.country.assetName)")
      self.countryLabel.text = info.country.countryName
   }
}
