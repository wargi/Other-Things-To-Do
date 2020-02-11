//
//  DetailSummaryTableViewCell.swift
//  BoxOffice
//
//  Created by 박소정 on 17/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class SummaryDetailTableViewCell: UITableViewCell {
   //MARK: - Properties
   static let identifier = "SummaryDetailTableViewCell"
   @IBOutlet private weak var summaryLabel : UILabel! // 줄거리
   
   //MARK: - Set UI
   func configure(info: DetailMovieInfo) {
      summaryLabel.sizeToFit()
      self.summaryLabel.text = info.synopsis
   }
}
