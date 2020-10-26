# 마스킹의 합

## 1. 문제

```
1. 아래의 2차원 배열(3x3)을 하드코딩 해주세요.
3 5 1
3 8 1
1 1 5

2. 2차원 비트 배열(2x2)을 입력 받아 주세요.
ex)
1 1
1 0

3. 입력받은 비트베열을 하드코딩 배열을 좌표(0, 0)에 대입해서 1부분의 값을 더하면,
3 + 5 + 3 = 11입니다.

4. 비트배열을 하드코딩 배열에 대입했을 때, 가장 큰 값을 가져오는 좌표를 출력해주세요.
```

## 2. 입력
- 2차원 비트배열(2x2)을 입력 받아 주세요.

## 3. 출력

- 비트배열을 하드코딩 배열에 대입했을 때, 가장 큰 값을 가져오는 좌표를 출력해주세요.


## 4. 예제 입력
```
1 1
1 0
```

## 5. 예제 출력
```
(0,1)
```

## 6. 예제 입력

```
0 1
1 1
```

## 7. 예제 출력

```
(0,0)
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int map[3][3] = {
    3, 5, 1,
    3, 8, 1,
    1, 1, 5
};

int bitArray[2][2];

int calSum(int y, int x) {
    int sum = 0;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            if (bitArray[i][j] == 1) sum += map[i + y][j + x];
        }
    }
    return sum;
}

int main()
{
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) cin >> bitArray[i][j];
    }

    int max = -1, maxX, maxY;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            int res = calSum(i, j);
            if (max < res) {
                max = res;
                maxX = j;
                maxY = i;
            }
        }
    }

    cout << "(" << maxY << "," << maxX << ")";
}
```
