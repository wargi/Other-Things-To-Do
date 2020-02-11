//
//  Singleton.swift
//  SignUp
//
//  Created by 박상욱 on 25/07/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import Foundation

class UserInformation {
   static let shared = UserInformation()
   var info = Info()
   private init() {}
   
   func reset() {
      info = Info()
   }
}

struct Info {
   var id: String?
   var phone: String?
   var birth: Date?
}
