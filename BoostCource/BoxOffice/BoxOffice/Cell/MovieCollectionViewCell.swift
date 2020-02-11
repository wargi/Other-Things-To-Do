//
//  MovieCollectionViewCell.swift
//  BoxOffice
//
//  Created by 박소정 on 17/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
   //MARK: - Properties
   static let identifier = "MovieCollectionViewCell"
   @IBOutlet private weak var postImageView : UIImageView! // 영화 포스터 이미지
   @IBOutlet private weak var gradeImageView : UIImageView! // 시청 가능 연령
   @IBOutlet private weak var titleLabel : UILabel! // 영화 제목
   @IBOutlet private weak var reservationInformation : UILabel! // 예매 정보
   @IBOutlet private weak var releaseDateLabel : UILabel! // 개봉일
   var info: MovieInfo!
   
   //MARK: - Set UI
   func configure(info: MovieInfo) {
      self.info = info
      
      postImageView.loadImageUsingCacheWithURL(url: info.thumbURL)
      gradeImageView.image = UIImage(named: "ic_\(info.grade)")
      titleLabel.text = info.title
      reservationInformation.text = "\(info.reservationGrade)위(\(info.userRating)) / \(String(format: "%.1f", info.reservationRate))%"
      releaseDateLabel.text = "개봉일: \(info.releaseDate)"
   }
   
   override func prepareForReuse() {
      self.postImageView.image = nil
   }
}
