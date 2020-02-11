//
//  ViewController.swift
//  MyAlbum
//
//  Created by 박상욱 on 14/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit
import Photos

class AlbumListViewController: UIViewController {
   //MARK: - Properties
   @IBOutlet private weak var collectionView : UICollectionView!
   private var collections = [PHAssetCollection]()
   private var fetchAssets = [PHFetchResult<PHAsset>]()
   private var selctedIndexPath = IndexPath()
   
   //MARK:- VC Life Cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      
      getAurhorizationStatus()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      PHPhotoLibrary.shared().register(self)
   }
   
   // Auth
   private func getAurhorizationStatus() {
      let status = PHPhotoLibrary.authorizationStatus()
      
      switch status {
      case .authorized:
         
         OperationQueue.main.addOperation {
            self.assetCollectionLoad()
            self.collectionView.reloadData()
         }
      case .notDetermined:
         PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
               OperationQueue.main.addOperation {
                  self.assetCollectionLoad()
                  self.collectionView.reloadData()
               }
            default:
               break
            }
         }
      case .denied, .restricted:
         let alert = UIAlertController(title: "포토 라이브러리 권한 필요",
                                       message: "저희 앱은 사진의 권한 허용이 필요합니다",
                                       preferredStyle: .alert)
         let okAction = UIAlertAction(title: "설정으로 가기",
                                      style: .default) { (_) in
                                       if let url = URL(string: UIApplication.openSettingsURLString) {
                                          UIApplication.shared.open(url,
                                                                    options: [UIApplication.OpenExternalURLOptionsKey : Any](), completionHandler: nil)
                                       }
         }
         let cancelAction = UIAlertAction(title: "취소",
                                          style: .cancel,
                                          handler: nil)
         
         alert.addAction(okAction)
         alert.addAction(cancelAction)
         DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
         }
         
         
      default:
         fatalError()
      }
   }
   
   private func assetCollectionLoad() {
      var assetCollection = PHFetchResult<PHAssetCollection>()
      
      guard let cameraRoll = PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
                                                                     subtype: .smartAlbumUserLibrary,
                                                                     options: nil).firstObject else { return }
      guard let favorite = PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
                                                                   subtype: .smartAlbumFavorites,
                                                                   options: nil).firstObject else { return }
      guard let selfie = PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
                                                                 subtype: .smartAlbumSelfPortraits,
                                                                 options: nil).firstObject else { return }
      
      assetCollection = PHAssetCollection.fetchAssetCollections(with: .album,
                                                                subtype: .any,
                                                                options: nil)
      
      collections.append(cameraRoll)
      collections.append(favorite)
      collections.append(selfie)
      
      assetCollection.objects(at: IndexSet(0 ..< assetCollection.count)).forEach { (collection) in
         collections.append(collection)
      }
      
      collections.forEach { (collection) in
         fetchAssets.append(getReusltPHAsset(collection: collection))
      }
   }
   
   //
   private func getReusltPHAsset(collection: PHAssetCollection, ascending: Bool = false) -> PHFetchResult<PHAsset> {
      let fetchOption = PHFetchOptions()
      fetchOption.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: ascending)]
      let fetchAssets = PHAsset.fetchAssets(in: collection, options: fetchOption)
      
      return fetchAssets
   }
   
   // Segue
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      super.prepare(for: segue, sender: sender)
      
      guard let vc = segue.destination as? PictureListViewController else { return }
      guard let cell = sender as? AlbumListCollectionViewCell else { return }
      guard let indexPath = self.collectionView.indexPath(for: cell) else { return }
      
      self.selctedIndexPath = indexPath
      vc.configure(collection: collections[indexPath.item])
      vc.navigationItem.title = collections[indexPath.item].localizedTitle
   }
}

//MARK: - UICollectionViewDataSource
extension AlbumListViewController: UICollectionViewDataSource {
   // Number Of Items In Section
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return collections.count
   }
   
   // Cell For Item At
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumListCollectionViewCell.identifier, for: indexPath) as! AlbumListCollectionViewCell
      
      cell.configure(title: collections[indexPath.item].localizedTitle,
                     assets: fetchAssets[indexPath.item])
      
      return cell
   }
}

//MARK: - UICollectionViewDelegateFlowLayout
// Cell 크기 설정
extension AlbumListViewController: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let orientation = UIApplication.shared.statusBarOrientation
      var cellSize: CGFloat = 0
      
      if orientation == .landscapeLeft || orientation == .landscapeRight {
         cellSize = (self.collectionView.bounds.width - 30) / 3
         return CGSize(width: cellSize, height: cellSize + 50)
      } else {
         cellSize = (self.collectionView.bounds.width - 30) / 2
         return CGSize(width: cellSize, height: cellSize + 50)
      }
   }
}

extension AlbumListViewController: PHPhotoLibraryChangeObserver {
   func photoLibraryDidChange(_ changeInstance: PHChange) {
      DispatchQueue.main.sync {
         if let changes = changeInstance.changeDetails(for: fetchAssets[selctedIndexPath.item]) {
            fetchAssets[selctedIndexPath.item] = changes.fetchResultAfterChanges
         }
         self.collectionView.reloadItems(at: [self.selctedIndexPath])
      }
   }
}
