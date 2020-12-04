# 4x3 배열 만들기

## 1. 문제
- 2차원 배열(4x3)을 만들고 내부의 값을 0으로 초기화 해주세요.

- 좌표 네 개를 입력받고, 입력받은 좌표에 값을 5로 바꾸고, 결과를 출력해주세요.

## 2. 입력
- 좌표(y, x)를 네 개를 입력받습니다.

## 3. 출력
- 값을 변경한 후 2차원 배열(4x3)을 출력해주세요.

## 4. 예제 입력

```
0 1
1 1
2 0
3 0
```

## 4. 예제 출력
```
0 5 0
0 5 0
5 0 0
5 0 0
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    int input[4][2];
    int vect[4][3] = { 0 };

    for (int t = 0; t < 4; t++) {
        for (int u = 0; u < 2; u++) {
            cin >> input[t][u];
        }
        int ny = input[t][0];
        int nx = input[t][1];
        vect[ny][nx] = 5;
    }

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            cout << vect[i][j] << " ";
        }
        cout << "\n";
    }
}
```
