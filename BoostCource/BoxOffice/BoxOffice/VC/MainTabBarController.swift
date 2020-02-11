//
//  MainTabBarController.swift
//  BoxOffice
//
//  Created by 박상욱 on 11/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
   override func viewDidLoad() {
      super.viewDidLoad()
      
   }
   
   
   
   //MARK: - 영화 정렬 변경 Alert
   @IBAction private func settingAction(_ sender: UIBarButtonItem) {
      guard let tableVC = self.viewControllers?[0] as? TableListViewController else { return }
      guard let collectionVC = self.viewControllers?[1] as? CollectionListViewController else { return }
      
      let alert = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요?", preferredStyle: .actionSheet)
      let ticketingAction = UIAlertAction(title: "예매율",
                                          style: .default) { (_) in
                                             MovieData.shared.changeMovieList(order: .reservationRate)
                                             
                                             switch self.selectedIndex {
                                             case 0:
                                                tableVC.tableView.reloadData()
                                             default:
                                                collectionVC.collectionView.reloadData()
                                             }
                                             
                                             self.navigationItem.title = "예매율순"
      }
      
      let curationAction = UIAlertAction(title: "큐레이션",
                                         style: .default) { (_) in
                                          MovieData.shared.changeMovieList(order: .quration)
                                          
                                          switch self.selectedIndex {
                                          case 0:
                                             tableVC.tableView.reloadData()
                                          default:
                                             collectionVC.collectionView.reloadData()
                                          }
                                          
                                          self.navigationItem.title = "큐레이션"
      }
      
      let releaseAction = UIAlertAction(title: "개봉일",
                                        style: .default) { (_) in
                                          MovieData.shared.changeMovieList(order: .releaseDate)
                                          
                                          switch self.selectedIndex {
                                          case 0:
                                             tableVC.tableView.reloadData()
                                          default:
                                             collectionVC.collectionView.reloadData()
                                          }
                                          
                                          self.navigationItem.title = "개봉일순"
      }
      
      let cancelAction = UIAlertAction(title: "취소",
                                       style: .cancel,
                                       handler: nil)
      
      alert.addAction(ticketingAction)
      alert.addAction(curationAction)
      alert.addAction(releaseAction)
      alert.addAction(cancelAction)
      
      self.present(alert, animated: true, completion: nil)
   }
}
