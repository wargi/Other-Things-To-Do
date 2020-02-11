//
//  ViewController.swift
//  BoxOffice
//
//  Created by 박상욱 on 11/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class TableListViewController: UIViewController {
   //MARK:- Properties
   @IBOutlet weak var tableView : UITableView!
   
   //MARK:- VC Life Cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      
      setRefresh()
      MovieData.shared.fetch(order: .quration) {
         DispatchQueue.main.async {
            self.tableView.reloadData()
         }
      }
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      tableView.reloadData()
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let vc = segue.destination as? DetailTableViewController else { return }
      guard let cell = sender as? MovieTableViewCell else { return }
      
      vc.selectMovieDataLoad(id: cell.info.movieId)
      vc.navigationItem.title = cell.info.title
   }
   
   //MARK:- Refresh
   func setRefresh() {
      let refresh = UIRefreshControl()
      refresh.addTarget(self, action: #selector(self.refreshAction(sender:)), for: .valueChanged)
      
      tableView.refreshControl = refresh
   }
   
   @objc func refreshAction(sender: UIRefreshControl) {
      MovieData.shared.fetch(order: .quration) {
         DispatchQueue.main.async {
            sender.endRefreshing()
            self.tableView.reloadData()
         }
      }
   }
}

//MARK:- TableView DataSource & Delegate
extension TableListViewController: UITableViewDataSource, UITableViewDelegate {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return MovieData.shared.movieList.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
      
      cell.configure(info: MovieData.shared.movieList[indexPath.row])
      
      return cell
   }
}
