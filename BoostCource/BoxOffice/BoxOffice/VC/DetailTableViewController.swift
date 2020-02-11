//
//  DetailTableViewController.swift
//  BoxOffice
//
//  Created by 박상욱 on 17/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController {
   //MARK:- Properties
   var movieInfo: DetailMovieInfo?
   var commentsData: [CommentData] = []
   @IBOutlet private weak var indicator : UIActivityIndicatorView!
   @IBOutlet private weak var tableView: UITableView!
   
   //MARK:- VC Life Cycle
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      guard let info = movieInfo else { return }
      commentsDataLoad(id: info.movieId)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.indicator.startAnimating()
      indicator.layer.cornerRadius = 5
      tableView.separatorStyle = .none
   }
   
   //MARK:- Data Load
   func selectMovieDataLoad(id: String) {
      ServiceList.getMovieInfo(movieId: id) { result in
         
         switch result {
         case .success(let info):
            self.movieInfo = info
            self.commentsDataLoad(id: id)
            DispatchQueue.main.async {
               self.tableView.reloadData()
               self.indicator.stopAnimating()
            }
         case .error(let err):
            print(err.localizedDescription)
         }
      }
   }
   
   func commentsDataLoad(id: String) {
      ServiceList.getCommentsList(movieId: id) { result in
         switch result {
         case .success(let comments):
            self.commentsData = comments.comments
            DispatchQueue.main.async {
               self.tableView.reloadSections(IndexSet(4...4), with: .none)
            }
         case .error(let err):
            print(err.localizedDescription)
         }
      }
   }
   
   @IBAction private func editCommentPresent(_ sender: UIButton) {
      guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditCommentViewController") as? EditCommentViewController else { return }
      guard let info = movieInfo?.movieId else { return }
      vc.info = info
      
      self.navigationController?.pushViewController(vc, animated: true)
   }
   
   //MARK:- Tap Actiom
   @objc func tapAction(sender: UITapGestureRecognizer) {
      guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "FullScreenImageViewController") as? FullScreenImageViewController else { return }
      guard let imageView = sender.view as? UIImageView else { return }
      vc.image = imageView.image
      
      self.present(vc, animated: true, completion: nil)
   }
}

//MARK:- TableView DataSource
extension DetailTableViewController: UITableViewDataSource {
   // Section: Detail TableView Cell
   // 0: Title
   // 1: Summary
   // 2: Memeber
   // 3: Edit Comment
   // 4: Comment List
   func numberOfSections(in tableView: UITableView) -> Int {
      return 5
   }
   
   // Number Of Rows In Section
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      switch section {
      case 0...3:
         return 1
      default:
         return commentsData.count
      }
   }
   
   // Cell For Row
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let info = movieInfo else { return UITableViewCell() }
      
      switch indexPath.section {
      case 0:
         let cell = tableView.dequeueReusableCell(withIdentifier: TitleDetailTableViewCell.identifier,
                                                  for: indexPath) as TitleDetailTableViewCell
         
         cell.configure(info: info)
         
         let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(sender:)))
         cell.postImageView.addGestureRecognizer(tap)
         
         return cell
      case 1:
         let cell = tableView.dequeueReusableCell(withIdentifier: SummaryDetailTableViewCell.identifier,
                                                  for: indexPath) as SummaryDetailTableViewCell
         
         cell.configure(info: info)
         
         return cell
      case 2:
         let cell = tableView.dequeueReusableCell(withIdentifier: MemberDetailTableViewCell.identifier,
                                                  for: indexPath) as MemberDetailTableViewCell
         
         cell.configure(info: info)
         
         return cell
      case 3:
         let cell = tableView.dequeueReusableCell(withIdentifier: EditCommentTableViewCell.identifier,
                                                  for: indexPath) as EditCommentTableViewCell
         return cell
      default:
         let cell = tableView.dequeueReusableCell(withIdentifier: CommentDetailTableViewCell.identifier,
                                                  for: indexPath) as CommentDetailTableViewCell
         
         cell.configure(comment: commentsData[indexPath.row])
         
         return cell
      }
   }
}

//MARK:- TableView Delegate
extension DetailTableViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      switch section {
      case 0, 4:
         return 0
      default:
         return 10
      }
   }
}

extension UITableView {
   func dequeueReusableCell<T: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath) -> T {
      guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
         fatalError()
      }
      return cell
   }
}
