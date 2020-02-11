import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ S : inout String) -> Int {
   // write your code in Swift 4.2.1 (Linux)
   var countArr = [Int]()
   var count = 0
   let strArr = S.split(separator: " ").map(String.init)
   
   for i in 0..<strArr.count {
      let s = strArr[i]
      count += 1

      if s.contains("?") || s.contains("!") || s.contains(".") {
         if let char = s.first, char == "?" || char == "!" || char == "." {
            countArr.append(count - 1)
            count = 0
         } else if let char = s.last, char == "?" || char == "!" || char == "." {
            countArr.append(count)
            count = 0
         } else {
            countArr.append(count)
            count = 1
         }
      }
      
      if i == strArr.count - 1 && count != 0 { countArr.append(count) }
   }
   
   countArr.sort()
   
   return countArr[countArr.count - 1]
}

var a = "Forget  CVs..Save time . x x"
print(solution(&a))
