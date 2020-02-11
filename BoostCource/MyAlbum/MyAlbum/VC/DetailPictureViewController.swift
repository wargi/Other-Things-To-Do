//
//  DetailPictureViewController.swift
//  MyAlbum
//
//  Created by 박상욱 on 14/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit
import Photos

class DetailPictureViewController: UIViewController {
   
   //MARK:- Properties
   static let identifier = "DetailPictureViewController"
   @IBOutlet private weak var assetImageView : UIImageView!
   @IBOutlet private weak var shareBarButtonItem : UIBarButtonItem!
   @IBOutlet private weak var favoriteBarButtonItem : UIBarButtonItem!
   @IBOutlet private weak var deleteBarButtonItem : UIBarButtonItem!
   @IBOutlet private weak var toolbar : UIToolbar!
   @IBOutlet private weak var scrollView : UIScrollView!
   @IBOutlet private weak var imageViewTopConstraint : NSLayoutConstraint!
   @IBOutlet private weak var imageViewBottomConstraint : NSLayoutConstraint!
   @IBOutlet private weak var imageViewLeadingConstraint : NSLayoutConstraint!
   @IBOutlet private weak var imageViewTrailingConstraint : NSLayoutConstraint!
   private var navititleView = UIView()
   private var scale: CGFloat = 1.0
   private var isFavorite = false
   private var isNavi = false
   private var asset = PHAsset()
   private var dateFormatter: DateFormatter {
      let dateformatter = DateFormatter()
      dateformatter.dateFormat = "YYYY-MM-dd a hh:mm:ss"
      return dateformatter
   }
   
   //MARK:- VC Life Cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      setUI()
      isFavorite = asset.isFavorite
      setFavorite()
      
      
      NotificationCenter.default.addObserver(self,
                                             selector: #selector(self.didRotated),
                                             name: UIDevice.orientationDidChangeNotification,
                                             object: nil)
      switch UIDevice.current.orientation {
      case .landscapeLeft, .landscapeRight:
         setNaviTitle()
      default:
         createNavigationTitleView()
      }
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      PHPhotoLibrary.shared().register(self)
   }
   
   override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()
      updateMinZoomScaleForSize(view.bounds.size)
   }
   
   //MARK:- Actions...
   internal func configure(asset: PHAsset) {
      self.asset = asset
   }
   
   // UI 설정
   private func setUI() {
      // image Request Options
      let options = PHImageRequestOptions()
      options.deliveryMode = .highQualityFormat
      options.isNetworkAccessAllowed = false
      options.isSynchronous = true
      
      PHImageManager().requestImage(for: asset,
                                    targetSize: CGSize(width: asset.pixelWidth,
                                                       height: asset.pixelHeight),
                                    contentMode: .aspectFit,
                                    options: nil) { (image, _) in
                                       self.assetImageView.image = image
      }
      
      
      let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapAction))
      self.view.addGestureRecognizer(tap)
   }
   
   @objc private func tapAction() {
      if toolbar.isHidden {
         self.navigationController?.navigationBar.isHidden = false
         self.toolbar.isHidden = false
         self.view.backgroundColor = .white
      } else {
         self.navigationController?.navigationBar.isHidden = true
         self.toolbar.isHidden = true
         self.view.backgroundColor = .black
      }
   }
   private func setNaviTitle() {
      guard let date = asset.creationDate else { return }
      self.navigationItem.titleView = nil
      self.navigationItem.title = self.dateFormatter.string(from: date)
   }
   
   // Crate Navigation Title View
   private func createNavigationTitleView() {
      guard let date = asset.creationDate else { return }
      let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 160, height: 44))
      let mainTitleLabel = UILabel(frame: CGRect(x: 0, y: 5, width: 160, height: 17))
      let subTitleLable = UILabel(frame: CGRect(x: 0, y: 22, width: 160, height: 15))
      
      mainTitleLabel.font = .boldSystemFont(ofSize: 15)
      mainTitleLabel.textAlignment = .center
      subTitleLable.font = .systemFont(ofSize: 13)
      subTitleLable.textAlignment = .center
      subTitleLable.textColor = .darkGray
      
      let string = self.dateFormatter.string(from: date) as NSString
      var r = NSMakeRange(0, 10)
      mainTitleLabel.text = string.substring(with: r)
      r = NSMakeRange(11, 11)
      subTitleLable.text = string.substring(with: r)
      
      titleView.addSubview(mainTitleLabel)
      titleView.addSubview(subTitleLable)
      
      navititleView = titleView
      self.navigationItem.titleView = navititleView
   }
   
   private func setFavorite() {
      if isFavorite {
         self.favoriteBarButtonItem.title = "❤️"
      } else {
         self.favoriteBarButtonItem.title = "🖤"
      }
   }
   
   private func updateMinZoomScaleForSize(_ size: CGSize) {
      let widthScale = size.width / assetImageView.bounds.width
      let heightScale = size.height / assetImageView.bounds.height
      let minScale = min(widthScale, heightScale)
      
      scrollView.zoomScale = minScale
   }
   
   private func updateConstraintsForSize(_ size: CGSize) {
      let yOffset = max(0, (size.height - assetImageView.frame.height) / 2)
      imageViewTopConstraint.constant = yOffset
      imageViewBottomConstraint.constant = yOffset
      
      let xOffset = max(0, (size.width - assetImageView.frame.width) / 2)
      imageViewLeadingConstraint.constant = xOffset
      imageViewTrailingConstraint.constant = xOffset
      
      view.layoutIfNeeded()
   }
   
   @objc private func didRotated() {
      switch UIDevice.current.orientation {
      case .landscapeLeft, .landscapeRight:
         updateConstraintsForSize(self.view.bounds.size)
         scrollView.zoomScale = self.scale
         self.setNaviTitle()
      default:
         updateConstraintsForSize(self.view.bounds.size)
         scrollView.zoomScale = self.scale
         self.navigationItem.titleView = navititleView
      }
   }
   
   
   //MARK:- Bar Action
   // Share
   @IBAction private func shareAction(_ sender: UIBarButtonItem) {
      guard let image = self.assetImageView.image else { return }
      let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
      
      activityController.excludedActivityTypes = [.addToReadingList, .assignToContact]
      
      self.present(activityController, animated: true, completion: nil)
   }
   
   // Favorite
   @IBAction private func favoriteAction(_ sender: UIBarButtonItem) {
      isFavorite = !isFavorite
      PHPhotoLibrary.shared().performChanges({
         let request = PHAssetChangeRequest(for: self.asset)
         request.isFavorite = self.isFavorite
      }, completionHandler: { (success, error) in
         if success {
            OperationQueue.main.addOperation {
               self.setFavorite()
            }
         }
      })
   }
   
   // Delete
   @IBAction private func deleteAction(_ sender: UIBarButtonItem) {
      PHPhotoLibrary.shared().performChanges({
         PHAssetChangeRequest.deleteAssets([self.asset] as NSArray)
      }) { (success, error) in
         if success {
            OperationQueue.main.addOperation {
               self.navigationController?.popViewController(animated: true)
            }
         } else if let error = error {
            print(error.localizedDescription)
         }
      }
   }
}

extension DetailPictureViewController: UIScrollViewDelegate {
   func scrollViewDidZoom(_ scrollView: UIScrollView) {
      updateConstraintsForSize(self.view.bounds.size)
   }
   
   func viewForZooming(in scrollView: UIScrollView) -> UIView? {
      return self.assetImageView
   }
   
   func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
      self.navigationController?.navigationBar.isHidden = true
      self.toolbar.isHidden = true
      self.view.backgroundColor = .black
   }
   
   func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
      self.scale = scale
      
   }
}

extension DetailPictureViewController: PHPhotoLibraryChangeObserver {
   func photoLibraryDidChange(_ changeInstance: PHChange) {
      DispatchQueue.main.async {
         if let changes = changeInstance.changeDetails(for: self.asset) {
            if let asset = changes.objectAfterChanges {
               self.asset = asset
               self.isFavorite = self.asset.isFavorite
               self.setFavorite()
            } else {
               self.navigationController?.popViewController(animated: true)
            }
         }
      }
   }
}
