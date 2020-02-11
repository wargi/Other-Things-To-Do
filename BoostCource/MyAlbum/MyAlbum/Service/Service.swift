//
//  Service.swift
//  MyAlbum
//
//  Created by 박소정 on 02/09/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import Foundation
import Photos

enum PhotoRecordState {
   case none, change, full
}

class PhotoRecord {
   let asset: PHAsset
   var state = PhotoRecordState.none
   var image = UIImage()
   
   init(asset: PHAsset) {
      self.asset = asset
   }
}

class ImageDownloader: Operation {
   let photoRecord: PhotoRecord
   
   init(_ photoRecord: PhotoRecord) {
      self.photoRecord = photoRecord
   }
   
   override func main() {
      var assetImage: UIImage?
      
      PHImageManager().requestImage(for: photoRecord.asset,
                                    targetSize: CGSize(width: photoRecord.asset.pixelWidth,
                                                       height: photoRecord.asset.pixelHeight),
                                    contentMode: .aspectFit,
                                    options: nil) { (image, _) in
                                       assetImage = image
      }
      
      guard let image = assetImage else { return }
      photoRecord.image = image
      photoRecord.state = .full
   }
}

class PendingOperations {
   lazy var downloadsInProgress: [IndexPath: Operation] = [:]
   lazy var downloadQueue: OperationQueue = {
      var queue = OperationQueue()
      queue.name = "Download queue"
      queue.maxConcurrentOperationCount = 1
      return queue
   }()
}


