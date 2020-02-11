import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

func getNumber(_ s: String) -> String {
   var str: String = s
   var tempStr = ""
   
   str.split(separator: " ").map { (str) -> String in
      tempStr += str
      return String(str)
   }
   
   str = tempStr
   tempStr = ""
   
   str.split(separator: "-").map { (str) -> String in
      tempStr += str
      return String(str)
   }
   
   return tempStr
}

func getPhoneNumber(_ s: String) -> String {
   var str = s
   var tempStr = ""
   var count = 0
   var tCount = 0
   
   if s.count % 3 == 0 || s.count % 3 == 2 {
      str.map { (str) -> String in
         if count % 3 == 0 && count != 0 {
            tempStr += "-"
         }
         tempStr += String(str)
         count += 1
         return String(str)
      }
   } else {
      str.map { (str) -> String in
         if s.count - count > 3 {
            if count % 3 == 0 && count != 0 {
               tempStr += "-"
            }
         } else {
            tCount += 1
            if tCount == 2 {
               tempStr += "-"
            }
         }
         tempStr += String(str)
         count += 1
         return String(str)
      }
   }
   
   return tempStr
}

public func solution(_ S : inout String) -> String {
   // write your code in Swift 4.2.1 (Linux)
   let a = getNumber(S)
   let b = getPhoneNumber(a)
   
   return b
}
