//
//  ViewController.swift
//  SignUp
//
//  Created by 박상욱 on 24/07/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   //MARK:- Properties
   @IBOutlet private weak var idTF : UITextField!
   
   override func viewDidLoad() {
      

      super.viewDidLoad()
   }
   
   // 가입 완료시 ID를 출력
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      guard let id = UserInformation.shared.info.id else { return }
      self.idTF.text = id
   }
}

