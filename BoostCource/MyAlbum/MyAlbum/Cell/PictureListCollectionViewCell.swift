//
//  PictureListCollectionViewCell.swift
//  MyAlbum
//
//  Created by 박상욱 on 14/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit
import Photos

class PictureListCollectionViewCell: UICollectionViewCell {
   static let identifier = "PictureListCollectionViewCell"
   @IBOutlet private weak var assetImageView : UIImageView!
   
   internal func configure(image: UIImage) {
      self.assetImageView.image = image
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      self.assetImageView.image = nil
   }
}
