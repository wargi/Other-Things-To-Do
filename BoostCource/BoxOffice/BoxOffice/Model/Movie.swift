//
//  Movie.swift
//  BoxOffice
//
//  Created by 박상욱 on 18/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import Foundation

// 영화 리스트
struct MovieList: Codable {
   var list: [MovieInfo] // 영화 리스트
   
   private enum CodingKeys: String, CodingKey {
      case list = "movies"
   }
}

// 영화 정보
struct MovieInfo: Codable {
   let releaseDate: String // 개봉일
   let movieId: String // 영화 고유 ID
   let userRating: Double // 사용자 평점
   let reservationRate: Double // 예매율
   let reservationGrade: Int // 예매순위
   let thumbURL: String // 포스터 이미지 섬네일 주소
   let title: String // 영화제목
   let grade: Int // 관람등급
   
   private enum CodingKeys: String, CodingKey {
      case releaseDate = "date"
      case movieId = "id"
      case userRating = "user_rating"
      case reservationRate = "reservation_rate"
      case reservationGrade = "reservation_grade"
      case thumbURL = "thumb"
      case title, grade
   }
}

// 영화 상세 정보
struct DetailMovieInfo: Codable {
   let releaseDate: String // 개봉일
   let director: String // 감독
   let actor: String // 배우진
   let movieId: String // 영화 고유 ID
   let thumbURL: String // 포스터 이미지 섬네일 주소
   let userRating: Double // 사용자 평점
   let genre: String // 영화 장르
   let duration: Int // 영화 상영 길이
   let reservationRate: Double // 예매율
   let reservationGrade: Int // 예매순위
   let audience: Int // 총 관람객수
   let synopsis: String // 줄거리
   let title: String // 영화제목
   let grade: Int // 관람등급
   
   private enum CodingKeys: String, CodingKey {
      case grade, title, audience, actor, duration, director, synopsis, genre
      case thumbURL = "image"
      case reservationGrade = "reservation_grade"
      case reservationRate = "reservation_rate"
      case userRating = "user_rating"
      case releaseDate = "date"
      case movieId = "id"
   }
}

// Comments
struct Comments: Codable {
   let comments: [CommentData] // Comment List
}

// Comment 정보
struct CommentData: Codable {
   let rating: Double // 평점
   let timestamp: Double // 작성일시 UNIX Timestamp 값
   let writer: String // 작성자
   let movieId: String // 영화 고유ID
   let contents: String // 한줄평 내용
   
   private enum CodingKeys: String, CodingKey {
      case rating, timestamp, writer, contents
      case movieId = "movie_id"
   }
}

// Comment 정보
struct RequestCommentData: Codable {
   let rating: Double // 평점
   let writer: String // 작성자
   let movieId: String // 영화 고유ID
   let contents: String // 한줄평 내용
   
   private enum CodingKeys: String, CodingKey {
      case rating, writer, contents
      case movieId = "movie_id"
   }
}
