//
//  API.swift
//  BoxOffice
//
//  Created by 박상욱 on 18/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

private let baseURL = "http://connect-boxoffice.run.goorm.io"

enum OrderBy: Int {
   case reservationRate = 0
   case quration = 1
   case releaseDate = 2
}

// API Protocol
protocol APIProtocol
{
   var urlString: String { get }
}

enum API: APIProtocol {
   
   // ======= API 사용법 =======
   // LIST를 API URL 열거형으로 정의
   // 참조) String format에 아규먼트 값을 넣을 경우 필요한 형식
   // %d = Int, %@ = String
   // ======= API 내부 파라미터 =======
   // movieList order = 0: 예매율(default), 1: 큐레이션, 2: 개봉일
   // movieInfo movieId = 영화 고유 ID
   // commentsList movieId = 한줄평이 해당하는 영화 고유ID
   
   enum LIST: String {
      // 영화 목록
      case movieList = "/movies?order_type=%d"
      // 영화 정보
      case movieInfo = "/movie?id=%@"
      // 한줄평 목록
      case commentsList = "/comments?movie_id=%@"
      // 한줄평 등록
      case comment = "/comment"
   }
   
   // API List
   case movieList(order: OrderBy) // 영화 목록
   case movieInfo(movieId: String) // 영화 정보
   case commentsList(movieId: String) // 한줄평 목록
   case comment // 한줄평 등록
   
   
   // endPoint에 파라미터 값을 반환하는 변수
   private var endpointString: String {
      var tempString: String = ""
      switch self {
      case .movieList(let order): // 영화 목록
         tempString = String(format: LIST.movieList.rawValue, order.rawValue)
      case .movieInfo(let movieId): // 영화 정보
         tempString = String(format: LIST.movieInfo.rawValue, movieId)
      case .commentsList(let movieId): // 한줄평 목록
         tempString = String(format: LIST.commentsList.rawValue, movieId)
      case .comment: // 한줄평 등록
         tempString = String(format: LIST.comment.rawValue)
      }
      //tempString URL로 변경
      return tempString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
   }
   
   // 기본 URL 주소와 Endpoint를 합쳐주는 변수
   var urlString: String {
      return baseURL + self.endpointString
   }
}
