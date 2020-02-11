//
//  AdditionalSignUpViewController.swift
//  SignUp
//
//  Created by 박상욱 on 24/07/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class AdditionalSignUpViewController: UIViewController {
   //MARKN:- Properties
   @IBOutlet private weak var dateLabel : UILabel!
   @IBOutlet private weak var datePicker : UIDatePicker!
   @IBOutlet private weak var singUpButton : UIButton!
   @IBOutlet private weak var phoneNumberTF : UITextField!
   
   var dateFormatter: DateFormatter {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMMM d, YYYY"
      
      return dateFormatter
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      loadUserInfo()
      // 노티피케이션 등록
      NotificationCenter.default.addObserver(self,
                                             selector: #selector(self.checkEnable),
                                             name: NSNotification.Name("Enabled Button"),
                                             object: nil)
   }
   
   override func viewWillAppear(_ animated: Bool) {
      // 뷰를 새로 띄울때 이전에 저장한 정보가 있다면 조건 검사
      NotificationCenter.default.post(name: NSNotification.Name("Enabled Button"), object: nil)
   }
   
   // 빈 화면 터치시 키보드 숨기기
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      self.view.endEditing(true)
   }
   
   
   //MARK:- Data Action
   // 유저 정보 업데이트
   func loadUserInfo() {
      if let date = UserInformation.shared.info.birth {
         self.datePicker.date = date
         dateLabel.text = dateFormatter.string(from: date)
      }
      
      if let phoneNumber = UserInformation.shared.info.phone {
         self.phoneNumberTF.text = phoneNumber
      }
   }
   
   // 가입 조건 확인 함수
   @objc func checkEnable() {
      guard let text = UserInformation.shared.info.phone,
         text.count != 0,
         UserInformation.shared.info.birth != nil else {
            self.singUpButton.isEnabled = false
            return
      }
      self.singUpButton.isEnabled = true
   }
   
   // Phone Number Chage Text Editing Action
   @IBAction private func phoneNumberTextFieldChangeEditing(_ sender: UITextField) {
      UserInformation.shared.info.phone = self.phoneNumberTF.text ?? ""
      NotificationCenter.default.post(name: NSNotification.Name("Enabled Button"), object: nil)
   }
   
   // DatePicker Value Change Action
   @IBAction private func datePickerAction(_ sender: UIDatePicker) {
      dateLabel.text = dateFormatter.string(from: sender.date)
      UserInformation.shared.info.birth = self.datePicker.date
      NotificationCenter.default.post(name: NSNotification.Name("Enabled Button"), object: nil)
   }
   
   
   //MARK:- Button Action
   // 취소 버튼 액션
   @IBAction private func cancelAction(_ sender: UIStoryboardSegue) {
      UserInformation.shared.reset()
      
      self.dismiss(animated: true, completion: nil)
   }
   
   // 이전 버튼 액션
   @IBAction private func prevAction(_ sender: UIButton) {
      self.navigationController?.popViewController(animated: true)
   }
   
   // 가입 버튼 액션
   @IBAction private func singUpAction(_ sender: UIButton) {
      UserInformation.shared.info.birth = nil
      UserInformation.shared.info.phone = nil
      
      self.dismiss(animated: true, completion: nil)
   }
}
