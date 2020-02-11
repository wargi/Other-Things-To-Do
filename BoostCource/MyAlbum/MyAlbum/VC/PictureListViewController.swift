//
//  PictureListViewController.swift
//  MyAlbum
//
//  Created by 박상욱 on 14/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit
import Photos

class PictureListViewController: UIViewController {
   //MARK:- Properties
   @IBOutlet private weak var collectionView : UICollectionView!
   @IBOutlet private weak var shareBarButtonItem : UIBarButtonItem!
   @IBOutlet private weak var sortBarButtonItem : UIBarButtonItem!
   @IBOutlet private weak var deleteBarButtonItem : UIBarButtonItem!
   @IBOutlet private weak var selectBarButtonItem : UIBarButtonItem!
   @IBOutlet private weak var tempLabel : UILabel!
   private var collection = PHAssetCollection()
   private var fetchResult = PHFetchResult<PHAsset>()
   private var photos: [PhotoRecord] = []
   private let pendingOperations = PendingOperations()
   private var selectIndexArray = [IndexPath]()
   private var tempTitle: String?
   private var isSelected = false
   private var ascending = false
   
   //MARK: - VC Life Cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      fetchResult = getReusltPHAsset(collection: collection)
      setUI()
      fetchPhotoDetails()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      PHPhotoLibrary.shared().register(self)
   }
   
   //MARK: - Set UI
   internal func configure(collection: PHAssetCollection) {
      self.collection = collection
   }
   
   private func setUI() {
      // Navigation Title
      tempTitle = navigationItem.title
      
      // Bar Button Enabled
      shareBarButtonItem.isEnabled = false
      sortBarButtonItem.isEnabled = true
      deleteBarButtonItem.isEnabled = false
   }
   
   // Photos...
   private func fetchPhotoDetails() {
      guard fetchResult.count > 0 else { return }
      fetchResult.objects(at: IndexSet(0..<fetchResult.count)).forEach { (asset) in
         let photoRecord = PhotoRecord(asset: asset)
         self.photos.append(photoRecord)
      }
      
      DispatchQueue.main.async {
         self.collectionView.reloadData()
      }
   }
   
   private func startDownload(for photoRecord: PhotoRecord, at indexPath: IndexPath) {
      guard pendingOperations.downloadsInProgress[indexPath] == nil else {
         return
      }
      
      let downloader = ImageDownloader(photoRecord)
      
      downloader.completionBlock = {
         if downloader.isCancelled {
            return
         }
         
         DispatchQueue.main.async {
            self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
            self.collectionView.reloadItems(at: [indexPath])
         }
      }
      
      pendingOperations.downloadsInProgress[indexPath] = downloader
      pendingOperations.downloadQueue.addOperation(downloader)
   }
   
   private func getReusltPHAsset(collection: PHAssetCollection, ascending: Bool = false) -> PHFetchResult<PHAsset> {
      let fetchOption = PHFetchOptions()
      fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: ascending)]
      let fetchAssets = PHAsset.fetchAssets(in: collection, options: fetchOption)
      
      return fetchAssets
   }
   
   private func loadImagesForOnscreenCells() {
      let pathsArray = collectionView.indexPathsForVisibleItems
      
      let allPendingOperations = Set(pendingOperations.downloadsInProgress.keys)
      var toBeCancelled = allPendingOperations
      
      let visiblePaths = Set(pathsArray)
      toBeCancelled.subtract(visiblePaths)
      
      var toBeStarted = visiblePaths
      toBeStarted.subtract(allPendingOperations)
      
      for indexPath in toBeCancelled {
         if let pendingDownload = pendingOperations.downloadsInProgress[indexPath] {
            pendingDownload.cancel()
         }
         pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
      }
      
      for indexPath in toBeStarted {
         let recordToProcess = photos[indexPath.row]
         startDownload(for: recordToProcess, at: indexPath)
      }
   }
   
   //MARK: - Bar Action
   // Select
   @IBAction private func selctAction(_ sender: UIBarButtonItem) {
      if isSelected {
         sender.title = "선택"
         navigationItem.title = tempTitle
         
         selectIndexArray.forEach { (indexPath) in
            guard let cell = self.collectionView.cellForItem(at: indexPath) else { return }
            cell.layer.borderWidth = 0
            cell.alpha = 1
         }
         
         // Reset
         selectIndexArray = []
         isSelected = false
         
         // Bar Button Enable
         sortBarButtonItem.isEnabled = true
         self.shareBarButtonItem.isEnabled = false
         self.deleteBarButtonItem.isEnabled = false
         
      } else {
         sender.title = "취소"
         tempTitle = navigationItem.title
         navigationItem.title = "항목 선택"
         isSelected = true
         
         // Bar Button Enable
         sortBarButtonItem.isEnabled = false
      }
   }
   
   // Share
   @IBAction private func shareAction(_ sender: UIBarButtonItem) {
      guard selectIndexArray.count > 0 else { return }
      var images: [UIImage] = []
      
      // image Request Options
      let options = PHImageRequestOptions()
      options.deliveryMode = .highQualityFormat
      options.isNetworkAccessAllowed = false
      options.isSynchronous = true
      
      for path in selectIndexArray {
         let asset = fetchResult.object(at: path.item)
         PHImageManager().requestImage(for: asset,
                                       targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                       contentMode: .aspectFit,
                                       options: options) { (image, _) in
                                          guard let image = image else { return }
                                          images.append(image)
         }
      }
      
      let activityController = UIActivityViewController(activityItems: images, applicationActivities: nil)
      
      activityController.excludedActivityTypes = [.addToReadingList, .assignToContact]
      activityController.completionWithItemsHandler = { (_, success, _, error ) in
         if success {
            let tempPath = self.selectIndexArray
            self.selctAction(self.selectBarButtonItem)
            self.collectionView.reloadItems(at: tempPath)
         } else if let error = error {
            print(error.localizedDescription)
         }
      }
      self.present(activityController, animated: true, completion: nil)
   }
   
   // Sort
   @IBAction private func sortAction(_ sender: UIBarButtonItem) {
      if ascending {
         sender.title = "최신순"
         ascending = false
      } else {
         sender.title = "과거순"
         ascending = true
      }
      fetchResult = getReusltPHAsset(collection: collection, ascending: ascending)
      photos.reverse()
      self.collectionView.reloadSections(IndexSet(0...0))
   }
   
   // Delete
   @IBAction private func deleteAction(_ sender: UIBarButtonItem) {
      var assets: [PHAsset] = []
      
      PHPhotoLibrary.shared().performChanges({
         for path in self.selectIndexArray {
            assets.append(self.fetchResult.object(at: path.item))
         }
         PHAssetChangeRequest.deleteAssets(assets as NSArray)
      }) { (success, error) in
         if success {
            DispatchQueue.main.async {
               self.selctAction(self.selectBarButtonItem)
            }
         } else if let error = error {
            print(error.localizedDescription)
         }
      }
   }
}

//MARK: - CollectionView DataSource
extension PictureListViewController: UICollectionViewDataSource {
   // Number Of Items In Section
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      if fetchResult.count == 0 {
         self.tempLabel.isHidden = false
      } else {
         self.tempLabel.isHidden = true
      }
      return fetchResult.count
   }
   
   // Cell For Item At
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureListCollectionViewCell.identifier,
                                                    for: indexPath) as! PictureListCollectionViewCell
      
      let photoDetails = photos[indexPath.item]
      
      cell.configure(image: photoDetails.image)
      
      switch photoDetails.state {
      case .none, .change:
         startDownload(for: photoDetails, at: indexPath)
      case .full:
         break
      }
      
      if selectIndexArray.contains(indexPath) {
         cell.layer.borderWidth = 5
         cell.alpha = 0.7
      } else {
         cell.layer.borderWidth = 0
         cell.alpha = 1
      }
      
      return cell
   }
}

//MARK: - CollectionView Delegate
extension PictureListViewController: UICollectionViewDelegate {
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      if self.isSelected {
         guard let cell = collectionView.cellForItem(at: indexPath) as? PictureListCollectionViewCell else { return }
         if selectIndexArray.contains(indexPath) {
            cell.layer.borderWidth = 0
            cell.alpha = 1
            selectIndexArray = selectIndexArray.filter { $0 != indexPath }
         } else {
            cell.layer.borderWidth = 5
            cell.alpha = 0.7
            selectIndexArray.append(indexPath)
         }
         
         if selectIndexArray.count == 0 {
            self.navigationItem.title = "항목 선택"
            self.shareBarButtonItem.isEnabled = false
            self.deleteBarButtonItem.isEnabled = false
         } else {
            self.navigationItem.title = "\(selectIndexArray.count)장 선택"
            self.shareBarButtonItem.isEnabled = true
            self.deleteBarButtonItem.isEnabled = true
         }
      } else {
         let vc = UIStoryboard.init(name: "Main",
                                    bundle: nil).instantiateViewController(withIdentifier: DetailPictureViewController.identifier) as! DetailPictureViewController
         
         vc.configure(asset: fetchResult.object(at: indexPath.item))
         
         self.navigationController?.pushViewController(vc, animated: true)
      }
   }
}

//MARK: - CollectionView DelegateFlowLayout
extension PictureListViewController: UICollectionViewDelegateFlowLayout {
   // Cell Size 설정
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let orientation = UIApplication.shared.statusBarOrientation
      var cellSize: CGFloat = 0
      
      if orientation == .landscapeLeft || orientation == .landscapeRight {
         cellSize = (collectionView.frame.size.width - 20) / 5
         return CGSize(width: cellSize, height: cellSize)
      } else {
         cellSize = (collectionView.frame.size.width - 10) / 3
         return CGSize(width: cellSize, height: cellSize)
      }
      
   }
}

extension PictureListViewController: UIScrollViewDelegate {
   func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
      pendingOperations.downloadQueue.isSuspended = true
   }
   
   func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
      if !decelerate {
         loadImagesForOnscreenCells()
         pendingOperations.downloadQueue.isSuspended = false
      }
   }
   
   func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
      loadImagesForOnscreenCells()
      pendingOperations.downloadQueue.isSuspended = false
   }
}


//MARK: - PHPhotoLibraryChangeObserver
extension PictureListViewController: PHPhotoLibraryChangeObserver {
   func photoLibraryDidChange(_ changeInstance: PHChange) {
      DispatchQueue.main.sync {
         if let changes = changeInstance.changeDetails(for: fetchResult) {
            fetchResult = changes.fetchResultAfterChanges
            if changes.hasIncrementalChanges {
               collectionView.performBatchUpdates({
                  if let removed = changes.removedIndexes, removed.count > 0 {
                     var count = 0
                     removed.forEach({ (item) in
                        photos.remove(at: item - count)
                        count += 1
                     })
                     collectionView.deleteItems(at: removed.map { IndexPath(item: $0, section:0) })
                  }
                  if let inserted = changes.insertedIndexes, inserted.count > 0 {
                     var count = 0
                     inserted.forEach({ (item) in
                        photos.insert(PhotoRecord(asset: fetchResult.object(at: item)),
                                      at: item + count)
                        count += 1
                     })
                     collectionView.insertItems(at: inserted.map { IndexPath(item: $0, section:0) })
                  }
                  if let changed = changes.changedIndexes, changed.count > 0 {
                     changed.forEach({ (item) in
                        photos[item] = PhotoRecord(asset: fetchResult.object(at: item))
                        photos[item].state = .change
                     })
                     collectionView.reloadItems(at: changed.map { IndexPath(item: $0, section:0) })
                  }
               })
            } else {
               collectionView.reloadData()
            }
         }
      }
   }
}
