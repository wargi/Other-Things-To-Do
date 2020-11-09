# 2차원 배열 위치 찾기

## 1. 문제
- ```
아래의 2차원 배열(3x4)을 하드코딩 해주세요.
  ADGJ
  BEHK
  CFIL
  ```
  
- 문자 1개를 입력받고, y와 x의 좌표를 입력받습니다.

- 만약, D 1 1을 입력받았다면, D의 위치(0, 1)에서 y + 1, x + 1의 위치의 알파벳(H)을 출력하시면 됩니다.


## 2. 입력
- 첫째 줄: 찾을 알파벳 한 개와 숫자 좌표(y, x)를 입력 받습니다.

## 3. 출력
- 찾은 알파벳에서 좌표만큼 떨어진 알파벳을 출력합니다.

## 4. 예제 입력
```
H 1 1
```

## 5. 예제 출력
```
L
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    char vect[3][5] = {
        "ADGJ",
        "BEHK",
        "CFIL"
    };

    int y, x;
    char ch;
    cin >> ch >> y >> x;

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 4; j++) {
            if (vect[i][j] == ch) {
                y += i;
                x += j;
            }
        }
    }

    cout << vect[y][x];
}
```
