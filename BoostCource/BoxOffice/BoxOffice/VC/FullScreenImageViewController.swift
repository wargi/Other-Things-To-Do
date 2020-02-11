//
//  FullScreenImageViewController.swift
//  BoxOffice
//
//  Created by 박상욱 on 19/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class FullScreenImageViewController: UIViewController {
   //MARK: - Properties
   @IBOutlet private weak var imageView : UIImageView!
   var image: UIImage?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      imageView.image = image
   }
   
   //MARK: - BarAction
   @IBAction private func dissmissAction(_ sender: UIButton) {
      self.dismiss(animated: true, completion: nil)
   }
}
