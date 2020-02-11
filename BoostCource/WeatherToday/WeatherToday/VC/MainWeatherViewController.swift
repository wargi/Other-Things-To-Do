//
//  ViewController.swift
//  WeatherToday
//
//  Created by 박상욱 on 29/07/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class MainWeatherViewController: UIViewController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
   }
   
   //MARK: - Navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let vc = segue.destination as? WeatherListViewController else { return }
      guard let cell = sender as? MainTableViewCell else { return }
      
      vc.navigationItem.title = cell.country?.country.countryName // 다음 VC의 타이틀 설정
      vc.cities = cell.country!.cities // 선택한 도시 정보 전달
   }
}

//MARK:- UITableViewDelegate & UITableViewDataSource
extension MainWeatherViewController: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return WeatherData.shared.weatherData.count // 국가 수 만큼 셀 표시
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier,
                                                     for: indexPath) as? MainTableViewCell else {
                                                      return UITableViewCell()
      }
      
      cell.configure(info: WeatherData.shared.weatherData[indexPath.row]) // 셀 업데이트(Image, Label...)
      
      return cell
   }
}
