# 패턴의 합 #

## 1. 문제

```
아래의 2차원 배열(4x5)을 하드코딩 해주세요.
3 5 4 2 5
3 3 3 2 1
3 2 6 7 8
9 1 1 3 2
```

- 패턴 사이즈를 입력 받아주세요.
- 예를 들어 2 2를 입력 받았다면, 2x2 사이즈의 합을 하드코딩 배열의 좌표를 대입하여 가장 큰 합을 리턴하는 좌표를 구해서 출력해주세요.
- 위의 예제는 (2, 3)의 좌표가 제일 크다 (7 + 8 + 3 + 2)

## 2. 입력
- 패턴의 사이즈 y, x를 입력 받습니다.

## 3. 출력
- 입력 받은 사이즈를 하드코딩 배열의 좌표에 대입하여 가장 큰 합을 리턴하는 좌표를 구해서 출력해주세요.

## 4. 예제 입력
```
2 2
```

## 5. 예제 출력
```
(2,3)
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int map[4][5] = {
    3, 5, 4, 2, 5,
    3, 3, 3, 2, 1,
    3, 2, 6, 7, 8,
    9, 1, 1, 3, 2
};
int width, height;

int sum(int y, int x) {
    int result = 0;
    for (int i = y; i < y + height; i++) {
        for (int j = x; j < x + width; j++) {
            result += map[i][j];
        }
    }
    return result;
}

int main()
{
    cin >> height >> width;

    int maxX, maxY, max = -1;
    for (int i = 0; i <= 4 - height; i++) {
        for (int j = 0; j <= 5 - width; j++) {
            int n = sum(i, j);
            if (max < n) {
                max = n;
                maxY = i;
                maxX = j;
            }
        }
    }

    cout << "(" << maxY << "," << maxX << ")";
}
```
