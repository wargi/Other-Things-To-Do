//
//  DefaultSignUpViewController.swift
//  SignUp
//
//  Created by 박상욱 on 24/07/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class DefaultSignUpViewController: UIViewController {
   //MARK:- Properties
   @IBOutlet private weak var imageView : UIImageView!
   @IBOutlet private weak var idTF : UITextField!
   @IBOutlet private weak var pwTF : UITextField!
   @IBOutlet private weak var pwCheckTF : UITextField!
   @IBOutlet private weak var contentTextView : UITextView!
   @IBOutlet private weak var nextButton : UIButton!
   let picker = UIImagePickerController()
   var passwordCheck = false
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.navigationController?.navigationBar.isHidden = true
      self.imagePickerSetting()
      self.textfieldSetting()
      NotificationCenter.default.addObserver(self,
                                             selector: #selector(self.checkEnable),
                                             name: NSNotification.Name(rawValue: "NextButtonEnabled"),
                                             object: nil)
   }
   
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      super.touchesBegan(touches, with: event)
      
      self.view.endEditing(true)
   }
   
   // 사용자 정보 입력 확인
   @objc func checkEnable() {
      guard let id = self.idTF.text,
         let content = self.contentTextView.text,
         self.imageView.image != nil,
         passwordCheck, id.count != 0, content.count != 0 else {
         self.nextButton.isEnabled = false
         return
      }
      self.nextButton.isEnabled = true
   }
   
   //MARK:- Image & Gesture
   func imagePickerSetting() {
      let gesture = UITapGestureRecognizer(target: self, action: #selector(self.addPhoto(sender:)))
      imageView.addGestureRecognizer(gesture)
      self.picker.delegate = self
   }
   
   // 제스쳐 액션
   @objc func addPhoto(sender: UITapGestureRecognizer) {
      picker.sourceType = .photoLibrary
      picker.allowsEditing = true
      
      self.present(picker, animated: false, completion: nil)
   }
   
   //MARK: Text
   func textfieldSetting() {
      idTF.tag = 0
      pwTF.tag = 1
      pwCheckTF.tag = 2
   }
   
   // 패스워드 조건 검사
   func samePassword(t1: String?, t2: String?) -> Bool {
      guard let t1 = t1, let t2 = t2, t1.count > 0, t2.count > 0 else { return false }
      
      return t1 == t2
   }
   
   // 텍스트 필드 값 검사
   @IBAction private func valueChangeText(_ sender: UITextField) {
      guard let text = sender.text else { return }
      if sender.tag == 1 {
         passwordCheck = self.samePassword(t1: text, t2: pwCheckTF.text)
      } else if sender.tag == 2 {
         passwordCheck = self.samePassword(t1: pwTF.text, t2: text)
      }
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NextButtonEnabled"), object: nil)
   }
   
   //MARK:- Button Action
   // 다음 버튼 액션
   @IBAction private func nextAction(_ sender: UIButton) {
      UserInformation.shared.info.id = self.idTF.text ?? ""
   }
   
   // 취소 버튼 액션
   @IBAction private func cancelAction(_ sender: UIButton) {
      UserInformation.shared.reset()
      
      self.dismiss(animated: true, completion: nil)
   }
}

//MARK:- UITextFieldDelegate
extension DefaultSignUpViewController: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      switch textField.tag {
      case 0:
         pwTF.becomeFirstResponder()
      case 1:
         pwCheckTF.becomeFirstResponder()
      default:
         contentTextView.becomeFirstResponder()
      }
      
      return true
   }
}

//MARK:- UITextViewDelegate
extension DefaultSignUpViewController: UITextViewDelegate {
   func textViewDidChange(_ textView: UITextView) {
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NextButtonEnabled"), object: nil)
   }
}

//MARK:- Image Picker Delegate
extension DefaultSignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
      self.imageView.image = image
      
      NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NextButtonEnabled"), object: nil)
      self.dismiss(animated: true, completion: nil)
   }
}
