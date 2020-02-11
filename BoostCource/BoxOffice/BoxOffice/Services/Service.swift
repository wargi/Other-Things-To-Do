//
//  Service.swift
//  BoxOffice
//
//  Created by 박상욱 on 19/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import Foundation
import UIKit

// 돌려보낼 서비스 Result Type
enum Result<T> {
   case success(T)
   case error(Error)
}

enum ServiceError: Error {
   case invalidURL
   case parsingError
}

// 서비스 타입
protocol ServiceType {
   // 영화 리스트
   static func getMovieList(order: OrderBy, completion: @escaping (Result<MovieList>) -> ())
   // 영화 상세 정보
   static func getMovieInfo(movieId id: String, completion: @escaping (Result<DetailMovieInfo>) -> ())
   // 코멘츠
   static func getCommentsList(movieId id: String, completion: @escaping (Result<Comments>) -> ())
   // 코멘트 등록
   static func setComment(movieId id: String, params: [String: Any], completion: @escaping (Result<RequestCommentData>) -> ())
}

struct ServiceList: ServiceType {
   // 영화 리스트
   static func getMovieList(order: OrderBy, completion: @escaping (Result<MovieList>) -> ()) {
      guard let url = URL(string: API.movieList(order: order).urlString) else { return }
      let dataTask = URLSession.shared.dataTask(with: url) { (data, res, err) in
         guard let data = data, err == nil else {
            print(err!.localizedDescription)
            return
         }
         
         do {
            let movieList = try JSONDecoder().decode(MovieList.self, from: data)
            completion(.success(movieList))
         } catch(let error) {
            completion(.error(error))
         }
      }
      dataTask.resume()
   }
   // 영화 상세 정보
   static func getMovieInfo(movieId id: String, completion: @escaping (Result<DetailMovieInfo>) -> ()) {
      guard let url = URL(string: API.movieInfo(movieId: id).urlString) else { return }
      let dataTask = URLSession.shared.dataTask(with: url) { (data, res, err) in
         guard let data = data, err == nil else {
            print(err!.localizedDescription)
            return
         }
         
         do {
            let movieInfo = try JSONDecoder().decode(DetailMovieInfo.self, from: data)
            completion(.success(movieInfo))
         } catch(let err) {
            completion(.error(err))
         }
      }
      dataTask.resume()
   }
   // Comment List Load
   static func getCommentsList(movieId id: String, completion: @escaping (Result<Comments>) -> ()) {
      guard let url = URL(string: API.commentsList(movieId: id).urlString) else { return }
      let dataTask = URLSession.shared.dataTask(with: url) { (data, res, err) in
         guard let data = data, err == nil else {
            print(err!.localizedDescription)
            return
         }
         
         do {
            let comments = try JSONDecoder().decode(Comments.self, from: data)
            completion(.success(comments))
         } catch {
            completion(.error(error))
         }
      }
      dataTask.resume()
   }
   // Comment 등록
   static func setComment(movieId id: String, params: [String: Any], completion: @escaping (Result<RequestCommentData>) -> ()) {
      guard let url = URL(string: API.comment.urlString) else { return }
      guard let data = try? JSONSerialization.data(withJSONObject: params) else { return }
      var request = URLRequest(url: url)
      
      request.httpMethod = "POST"
      request.httpBody = data
      
      let task = URLSession.shared.dataTask(with: request) { (data, res, err) in
         guard let data = data, err == nil else {
            print(err!.localizedDescription)
            return
         }
         do {
            let comment = try JSONDecoder().decode(RequestCommentData.self, from: data)
            completion(.success(comment))
         } catch {
            completion(.error(error))
         }
         
      }
      task.resume()
   }
}
