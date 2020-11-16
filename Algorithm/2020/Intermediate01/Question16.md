# 3차원 배열 3

## 1. 문제
- 아래의 3차원 배열(3x3x3)을 하드코딩 해주세요.

  ```
  AAA
  AAA
  AAA
  
  BBB
  BBB
  BBB
  
  CCC
  CCC
  CCC
  
  그리고 문자를 하나 입력 받습니다.
  만약 A를 입력했다면, 아래와 같이 출력해주세요.
  input: A
  output)
  
  AAA
  AAA
  AAA
  
  BBB
  BBB
  BBB
  
  CCC
  CCC
  CCC
  
  만약 B를 입력했다면, 아래와 같이 출력해주세요.
  input: B
  output)
  
  BBB
  BBB
  BBB
  
  CCC
  CCC
  CCC
  
  DDD
  DDD
  DDD
  ```

## 2. 입력
- 첫째 줄: 문자 한 개를 입력 받는다.

## 3. 출력
- 위의 예제의 규칙처럼 출력한다.

## 4. 예제 입력
```
C
```

## 5. 예제 출력
```
CCC
CCC
CCC

DDD
DDD
DDD

EEE
EEE
EEE
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    char ch;
    char map[3][3][3];

    cin >> ch;

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            for (int k = 0; k < 3; k++) {
                map[i][j][k] = ch + i;
                cout << map[i][j][k];
            }
            cout << "\n";
        }
        cout << "\n";
    }
}
```
