//
//  CollectionListViewController.swift
//  BoxOffice
//
//  Created by 박상욱 on 11/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class CollectionListViewController: UIViewController {
   //MARK:- Properties
   @IBOutlet weak var collectionView : UICollectionView!
   
   //MARK:- VC Life Cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      
      setRefresh()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      collectionView.reloadData()
   }
   
   //MARK:- Refresh
   func setRefresh() {
      let refresh = UIRefreshControl()
      refresh.addTarget(self, action: #selector(self.refreshAction(sender:)), for: .valueChanged)
      
      collectionView.refreshControl = refresh
   }
   
   @objc func refreshAction(sender: UIRefreshControl) {
      MovieData.shared.fetch(order: .quration) {
         DispatchQueue.main.async {
            sender.endRefreshing()
            self.collectionView.reloadData()
         }
      }
   }
}

//MARK:- CollectionView DataSource
extension CollectionListViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return MovieData.shared.movieList.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier,
                                                    for: indexPath) as! MovieCollectionViewCell
      
      cell.configure(info: MovieData.shared.movieList[indexPath.row])
      
      return cell
   }
}

//MARK:- CollectionView Delegate
extension CollectionListViewController:  UICollectionViewDelegate {
   // Did Select Item At
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailTableViewController") as? DetailTableViewController else { return }
      guard let cell = collectionView.cellForItem(at: indexPath) as? MovieCollectionViewCell else { return }
      
      vc.selectMovieDataLoad(id: cell.info.movieId)
      vc.navigationItem.title = cell.info.title
      
      self.navigationController?.pushViewController(vc, animated: true)
   }
}

//MARK:- CollectionView Delegate FlowLayout
extension CollectionListViewController: UICollectionViewDelegateFlowLayout {
   // 셀 크기 설정
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize(width: 50,
                                                                                                  height: 50)}
      let height = collectionView.bounds.width - (layout.sectionInset.left + layout.sectionInset.right) - 10
      
      return CGSize(width: height / 2, height: height)
   }
}
