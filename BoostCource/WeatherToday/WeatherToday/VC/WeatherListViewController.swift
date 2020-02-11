//
//  DetailWeatherViewController.swift
//  WeatherToday
//
//  Created by 박상욱 on 06/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController {
   //MARK:- Properties
   var cities = [WeatherCity]() // 도시들의 정보
   @IBOutlet private weak var tableView : UITableView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }

   //Mark: - Navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let vc = segue.destination as? DetailWeatherViewController else { return }
      guard let cell = sender as? DetailTableViewCell else { return }
      let indexPath = self.tableView.indexPath(for: cell)
      let city = cities[indexPath!.row]
      vc.navigationItem.title = cell.city?.name // 다음 VC의 타이틀 설정
      vc.city = city // 해당 도시의 정보 전달
   }
}

//MARK:- UITableViewDelegate & UITableViewDataSource
extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return cities.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier,
                                                     for: indexPath) as? DetailTableViewCell else {
                                                      return UITableViewCell()
      }
      
      cell.configure(info: cities[indexPath.row]) // 셀 업데이트(Image, Label...)
      
      return cell
   }
}
