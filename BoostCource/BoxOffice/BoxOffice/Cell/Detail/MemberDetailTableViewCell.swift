//
//  DetailMemberTableViewCell.swift
//  BoxOffice
//
//  Created by 박상욱 on 17/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class MemberDetailTableViewCell: UITableViewCell {
   //MARK: - Properties
   static let identifier = "MemberDetailTableViewCell"
   @IBOutlet private weak var foremanLabel : UILabel! // 감독
   @IBOutlet private weak var actorLabel : UILabel! // 출연진
   
   //MARK: - Set UI
   func configure(info: DetailMovieInfo) {
      self.foremanLabel.text = info.director
      self.actorLabel.text = info.actor
   }
}
