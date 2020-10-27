# 특정 구역의 합

## 1. 문제

- 2차원 배열(4x4)을 입력 받고, 입력 받은 배열에서 2x3 사이즈의 합이 가장 큰 좌표를 출력해주세요.

## 2. 입력
- 2차원 배열(4x4)을 입력 받아주세요.

## 3. 출력

- 입력 받은 배열에서 2x3 사이즈의 합이 가장 큰 좌표를 출력해주세요.

## 4. 예제 입력

```
1 5 9 13
2 6 10 14
3 7 11 15
4 8 12 16
```

## 5. 예제 출력
```
(2, 1)
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int image[4][4];

int calSum(int startY, int startX) {
    int sum = 0;
    for (int i = startY; i < startY + 2; i++) {
        for (int j = startX; j < startX + 3; j++) {
            sum += image[i][j];
        }
    }

    return sum;
}

int main()
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            cin >> image[i][j];
        }
    }

    int max = -1, maxY, maxX;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 2; j++) {
            int x = calSum(i, j);

            if (x > max) {
                max = x;
                maxY = i;
                maxX = j;
            }
        }
    }

    cout << "(" << maxY << "," << maxX << ")";
}
```
