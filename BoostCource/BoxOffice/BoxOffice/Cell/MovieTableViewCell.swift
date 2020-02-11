//
//  MovieTableViewCell.swift
//  BoxOffice
//
//  Created by 박상욱 on 11/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
   //MARK: - Properties
   static let identifier = "MovieTableViewCell"
   @IBOutlet private weak var postImageView : UIImageView! // 영화 포스터 이미지
   @IBOutlet private weak var gradeImageView : UIImageView! // 시청 가능 연령
   @IBOutlet private weak var titleLabel : UILabel! // 영화 제목
   @IBOutlet private weak var movieRankLabel : UILabel! // 별점
   @IBOutlet private weak var releaseDateLabel : UILabel! // 개봉일
   var info: MovieInfo!
   
   //MARK: - Set UI
   func configure(info: MovieInfo) {
      self.info = info
      
      postImageView.loadImageUsingCacheWithURL(url: info.thumbURL)
      gradeImageView.image = UIImage(named: "ic_\(info.grade)")
      titleLabel.text = info.title
      movieRankLabel.text = "평점: \(info.userRating) 예매순위: \(info.reservationGrade) 예매율: \(String(format: "%.1f", info.reservationRate))"
      releaseDateLabel.text = "개봉일: \(info.releaseDate)"
   }
   
   override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
   }
   
   // 재사용
   override func prepareForReuse() {
      self.postImageView.image = nil
   }
}
