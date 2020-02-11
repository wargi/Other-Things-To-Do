//
//  AlbumListCollectionViewCell.swift
//  MyAlbum
//
//  Created by 박상욱 on 14/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit
import Photos

class AlbumListCollectionViewCell: UICollectionViewCell {
   
   static let identifier = "AlbumListCollectionViewCell"
   @IBOutlet private weak var representativeImageView : UIImageView!
   @IBOutlet private weak var titleLabel : UILabel!
   @IBOutlet private weak var imageCountLabel : UILabel!
   
   internal func configure(title: String?, assets: PHFetchResult<PHAsset>) {
      // Set UI
      self.representativeImageView.layer.cornerRadius = 5
      self.titleLabel.text = title
      self.imageCountLabel.text = "\(assets.count)"
      
      // Album Image Count
      guard assets.count > 0 else { return }
      let asset = assets.object(at: 0)
      
      // Image
      PHImageManager().requestImage(for: asset,
                                    targetSize: self.representativeImageView.bounds.size,
                                    contentMode: .aspectFill,
                                    options: nil) { (image, _) in
                                       self.representativeImageView.image = image
      }
   }
   
   func getReusltPHAsset(collection: PHAssetCollection, ascending: Bool = false) -> PHFetchResult<PHAsset> {
      let fetchOption = PHFetchOptions()
      fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: ascending)]
      let fetchAssets = PHAsset.fetchAssets(in: collection, options: fetchOption)
      
      return fetchAssets
   }
   
   // Reuse Cell
   override func prepareForReuse() {
      super.prepareForReuse()
      
      self.representativeImageView.image = nil
   }
}
