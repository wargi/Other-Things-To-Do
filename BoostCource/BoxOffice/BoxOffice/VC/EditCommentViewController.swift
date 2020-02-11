//
//  EditCommentViewController.swift
//  BoxOffice
//
//  Created by 박상욱 on 17/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class EditCommentViewController: UIViewController {
   //MARK: - Properties
   @IBOutlet private weak var gradeImageView : UIImageView! // 시청 가능 연령
   @IBOutlet private weak var titleLabel : UILabel! // 영화 제목
   @IBOutlet private weak var usernameTextField : UITextField! // 유저명
   @IBOutlet private weak var commentTextView : UITextView! // 한줄평
   @IBOutlet private weak var ratingLabel : UILabel!
   @IBOutlet private weak var fiveStarRating : FiveStartRating!
   var info = ""
   
   //MARK: - VC Life Cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      NotificationCenter.default.addObserver(self,
                                             selector: #selector(self.valueChangeAction(noti:)),
                                             name: NSNotification.Name("rating"),
                                             object: nil)
      textSetting()
   }
   
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
   }
   
   
   //MARK: - Set UI
   func textSetting() {
      if MovieData.shared.username.count != 0 {
         usernameTextField.text = MovieData.shared.username
      }
      usernameTextField.attributedPlaceholder = NSAttributedString(string: "유저명을 작성해주세요",
                                                                   attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
      commentTextView.layer.borderWidth = 0.5
      commentTextView.layer.borderColor = UIColor.orange.cgColor
      commentTextView.text = "한줄평을 작성해주세요"
      commentTextView.textColor = .lightGray
   }
   
   @objc func valueChangeAction(noti: Notification) {
      guard let rating = noti.userInfo?["rating"] as? Double else { return }
      ratingLabel.text = "\(Int(rating * 2))"
   }
   
   //MARK: - Bar Action
   @IBAction private func okAction(_ sender: UIBarButtonItem) {
      guard usernameTextField.text?.count != 0 else {
         let alert = UIAlertController(title: "유저명을 작성해주세요",
                                       message: "한줄평 작성에는 유저명이 필요합니다😃",
                                       preferredStyle: .alert)
         let action = UIAlertAction(title: "확인",
                                    style: .default,
                                    handler: nil)
         
         alert.addAction(action)
         self.present(alert, animated: true, completion: nil)
         return
      }
      
      guard commentTextView.text != "한줄평을 작성해주세요" else {
         let alert = UIAlertController(title: "한줄평을 입력해주세요",
                                       message: "한줄평이 필요합니다😃",
                                       preferredStyle: .alert)
         let action = UIAlertAction(title: "확인",
                                    style: .default,
                                    handler: nil)
         
         alert.addAction(action)
         self.present(alert, animated: true, completion: nil)
         return
      }
      guard let rating = Int(self.ratingLabel.text ?? "0") else { return }
      guard let username = usernameTextField.text else { return }
      guard let content = commentTextView.text else { return }
      
      let params: [String: Any] = [
         "rating": rating,
         "writer": username,
         "movie_id": info,
         "contents": content
         ]
      ServiceList.setComment(movieId: info,
                             params: params) { (result) in
                              switch result {
                              case .success(_):
                                 MovieData.shared.username = username
                              case .error(let err):
                                 print(err.localizedDescription)
                              }
      }
      self.navigationController?.popViewController(animated: true)
   }
   
   @IBAction private func cancelAction(_ sender: UIBarButtonItem) {
      self.navigationController?.popViewController(animated: true)
   }
}

//MARK: - UITextViewDelegate
extension EditCommentViewController: UITextViewDelegate {
   func textViewDidBeginEditing(_ textView: UITextView) {
      if textView.textColor == UIColor.lightGray {
         textView.text = nil
         textView.textColor = .black
      }
   }
   
   func textViewDidEndEditing(_ textView: UITextView) {
      if textView.text.isEmpty {
         textView.text = "한줄평을 작성해주세요"
         textView.textColor = .lightGray
      }
   }
}
