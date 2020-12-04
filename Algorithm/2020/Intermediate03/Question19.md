# 폭탄 터트리기

## 1. 문제
- ```
아래의 2차원 배열(4x5) 하드코딩 해주세요.
  _____
  _____
  _____
  _____
  
  좌표(y, x)를 2개 입력받고, 받은 좌표의 주위를 '#'으로 채운 결과값을 출력합니다.
  
  ex) 좌표(1, 1)과 좌표(1, 3)을 받으면, 아래처럼 됩니다.
  ###__     #####
  #_#__  -> #_#_#
  ###__     #####
  _____     _____
  ```
  

## 2. 입력
- 좌표(y, x)를 2개 입력받습니다.

## 3. 출력
- 받은 좌표의 주위를 '#'으로 채운 결과값을 출력합니다.

## 4. 예제 입력
```
1 1
1 3
```

## 5. 예제 출력
```
# # # # #
# _ # _ #
# # # # #
_ _ _ _ _
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    char boom[4][6] = {
        "_____",
        "_____",
        "_____",
        "_____"
    };

    int direct[8][2] = {
        -1, -1,
        -1, 0,
        -1, 1,
        0, -1,
        0, 1,
        1, -1,
        1, 0,
        1, 1
    };

    for (int i = 0; i < 2; i++) {
        int y, x;
        cin >> y >> x;

        for (int j = 0; j < 8; j++) {
            int ny = y + direct[j][0];
            int nx = x + direct[j][1];
            if (ny >= 0 && ny < 4 && nx >= 0 && nx < 5) boom[ny][nx] = '#';
        }
    }

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 5; j++) {
            cout << boom[i][j] << " ";
        }
        cout << "\n";
    }
}
```