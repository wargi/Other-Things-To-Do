import Foundation
import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

func getNodeCount(_ x: Int, count: Int, arr: [Int]) -> Int {
   if arr[x] == -1 {
      return count + 1
   } else {
      return getNodeCount(arr[x], count: count+1, arr: arr)
   }
}

public func solution(_ A : inout [Int]) -> Int {
   // write your code in Swift 4.2.1 (Linux)
   return getNodeCount(A[0], count: 1, arr: A)
}
