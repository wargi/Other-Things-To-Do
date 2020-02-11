//
//  CommentDetailTableViewCell.swift
//  BoxOffice
//
//  Created by 박상욱 on 17/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class CommentDetailTableViewCell: UITableViewCell {
   //MARK: - Properties
   static let identifier = "CommentDetailTableViewCell"
   @IBOutlet private weak var usernameLabel : UILabel! // 유저명
   @IBOutlet private weak var commentDateLable : UILabel! // 작성일
   @IBOutlet private weak var commentLable : UILabel! // 한줄평
   @IBOutlet private weak var firstStarImageView : UIImageView!
   @IBOutlet private weak var secondStarImageView : UIImageView!
   @IBOutlet private weak var thirdStarImageView : UIImageView!
   @IBOutlet private weak var fourStarImageView : UIImageView!
   @IBOutlet private weak var fiveStarImageView : UIImageView!
   var starImageViews: [UIImageView] = []
   
   var dateformatter: DateFormatter {
      let formatter = DateFormatter()
      formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
      
      return formatter
   }
   
   //MARK: - Set UI
   func configure(comment: CommentData) {
      let date = Date(timeIntervalSince1970: comment.timestamp)
      
      self.usernameLabel.text = comment.writer
      self.commentDateLable.text = dateformatter.string(from: date)
      commentLable.sizeToFit()
      self.commentLable.text = comment.contents
      starImageViews = [firstStarImageView,
                        secondStarImageView,
                        thirdStarImageView,
                        fourStarImageView,
                        fiveStarImageView]
      
      let star = Int(comment.rating / 2)
      
      if star > 0 {
         for index in 0 ..< star {
            starImageViews[index].image = UIImage(named: "ic_star_large_full")
         }
      }
      
      let halfStar = (comment.rating / 2) - Double(star)
      if halfStar >= 0.5 {
         starImageViews[star].image = UIImage(named: "ic_star_large_half")
      }
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      
      starImageViews.forEach { $0.image = UIImage(named: "ic_star_large") }
   }
}
