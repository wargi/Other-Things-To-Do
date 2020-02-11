//
//  MovieData.swift
//  BoxOffice
//
//  Created by 박상욱 on 19/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import Foundation

class MovieData {
   //MARK: - Properties
   static let shared = MovieData()
   var movieList = [MovieInfo]() // 영화 리스트
   // 각각 정렬된 배열
   private var revationMovieList = [MovieInfo]() // 예매율 배열
   private var qurationMovieList = [MovieInfo]() // 큐레이션 배열
   private var releaseMovieList = [MovieInfo]() // 개봉일 배열
   var username = ""
   
   var formatter: DateFormatter {
      let formatter = DateFormatter()
      formatter.dateFormat = "YYYY-MM-dd"
      
      return formatter
   }
   private init() {}
   
   // 영화 리스트 Load
   func fetch(order: OrderBy, completion: @escaping () -> ()) {
      ServiceList.getMovieList(order: order) { result in
         switch result {
         case .success(let movieList):
            // Sort...
            self.qurationMovieList = movieList.list
            self.releaseMovieList = movieList.list.sorted(by: { (left, right) -> Bool in
               guard let leftDate = self.formatter.date(from: left.releaseDate) else { return false }
               guard let rightDate = self.formatter.date(from: right.releaseDate) else { return false }
               return leftDate > rightDate
            })
            self.revationMovieList = movieList.list.sorted(by: { (left, right) -> Bool in
               return left.reservationGrade < right.reservationGrade
            })
            // Data 전달
            self.movieList = self.revationMovieList
            completion()
         case .error(let err):
            print(err.localizedDescription)
         }
      }
   }
   // 영화 정렬 순서 변경
   func changeMovieList(order: OrderBy) {
      switch order {
      case .reservationRate:
         self.movieList = revationMovieList
      case .quration:
         self.movieList = qurationMovieList
      case .releaseDate:
         self.movieList = releaseMovieList
      }
   }
}
