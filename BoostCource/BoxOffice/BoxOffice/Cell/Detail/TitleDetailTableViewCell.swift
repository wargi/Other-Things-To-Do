//
//  DetailTableViewCell.swift
//  BoxOffice
//
//  Created by 박상욱 on 17/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class TitleDetailTableViewCell: UITableViewCell {
   //MARK: - Properties
   static let identifier = "TitleDetailTableViewCell"
   @IBOutlet weak var postImageView : UIImageView! // 영화 포스터 이미지
   @IBOutlet private weak var gradeImageView : UIImageView! // 시청 가능 연령
   @IBOutlet private weak var titleLabel : UILabel! // 영화 제목
   @IBOutlet private weak var releaseDateLabel : UILabel! // 개봉일
   @IBOutlet private weak var categoryLabel : UILabel! // 카테고리
   @IBOutlet private weak var reservationRateLabel : UILabel! // 예매율
   @IBOutlet private weak var starPointLabel : UILabel! // 평점
   @IBOutlet private weak var audienceCountLabel : UILabel! // 누적관객수
   // Star Point Image Views
   @IBOutlet private weak var firstStarImageView : UIImageView!
   @IBOutlet private weak var secondStarImageView : UIImageView!
   @IBOutlet private weak var thirdStarImageView : UIImageView!
   @IBOutlet private weak var fourStarImageView : UIImageView!
   @IBOutlet private weak var fiveStarImageView : UIImageView!
   var starImageViews: [UIImageView] = []
   
   // NumberFormatter
   var formatter: NumberFormatter {
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal
      
      return formatter
   }
   
   //MARK: - Set UI
   func configure(info: DetailMovieInfo) {
      guard let people = formatter.string(from: NSNumber(value: Int(info.audience))) else { return }
      let star = Int(info.userRating / 2)
      
      postImageView.loadImageUsingCacheWithURL(url: info.thumbURL)
      gradeImageView.image = UIImage(named: "ic_\(info.grade)")
      titleLabel.text = info.title
      releaseDateLabel.text = "\(info.releaseDate) 개봉"
      categoryLabel.text = "\(info.genre) / \(info.duration)분"
      reservationRateLabel.text = "\(info.reservationGrade)위 \(info.reservationRate)%"
      starPointLabel.text = "\(info.userRating)"
      audienceCountLabel.text = "\(people)"
      releaseDateLabel.text = "개봉일: \(info.releaseDate)"
      
      starImageViews = [firstStarImageView,
                        secondStarImageView,
                        thirdStarImageView,
                        fourStarImageView,
                        fiveStarImageView]
      
      if star > 0 {
         for index in 0 ..< star {
            starImageViews[index].image = UIImage(named: "ic_star_large_full")
         }
      }
      
      let halfStar = (info.userRating / 2) - Double(star)
      if halfStar >= 0.5 {
         starImageViews[star].image = UIImage(named: "ic_star_large_half")
      }
   }
}
