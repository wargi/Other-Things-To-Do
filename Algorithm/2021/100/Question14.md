# A/B

## 1. 문제

- 두 정수 A와 B를 입력받은 다음, A/B를 출력하는 프로그램을 작성하시오.

## 2. 입력
- 첫째 줄에 A와 B가 주어진다. (0 < A, B < 10)

## 3. 출력

- 첫째 줄에 A/B를 출력한다. 실제 정답과 출력값의 절대오차 또는 상대오차가 10-9 이하이면 정답이다.


## 4. 예제 입력
```
1 3
```

## 5. 예제출력

```
0.33333333333333333333333333333333
```

## 6. 코드

```swift
import Foundation

var ab = readLine()!
let strArr = ab.components(separatedBy: " ")

print(Double(strArr[0])! / Double(strArr[1])!)
```

