//
//  ImageCache.swift
//  BoxOffice
//
//  Created by 박상욱 on 19/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import Foundation
import UIKit

// image Cache 생성
let imageCache = NSCache<AnyObject, AnyObject>()

// url string이 같은 이미지의 경우 네트워크에서 받아오지 않고 미리 저장해둔 캐시 이미지에서 들고 오게 변경
// 이미지가 커서 매번 받아오는게 비효울 적인거 같아 고민해봤는데 맞는지는 잘모르겠습니다 ㅠㅠ ^^;
extension UIImageView {
   func loadImageUsingCacheWithURL(url: String) {
      guard imageCache.object(forKey: url as AnyObject) as? UIImage == nil else {
         DispatchQueue.main.async {
            self.image = imageCache.object(forKey: url as AnyObject) as? UIImage
         }
         return
      }
      let url = URL(string: url)!
      
      DispatchQueue.global().async {
         guard let imageData = try? Data(contentsOf: url) else { return }
         guard let image = UIImage(data: imageData) else { return }
         imageCache.setObject(image, forKey: url as AnyObject)
         DispatchQueue.main.async {
            self.image = image
         }
      }
   }
}
