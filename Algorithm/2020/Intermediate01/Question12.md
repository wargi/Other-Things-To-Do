# 3차원 배열

## 1. 문제
```
아래의 3차원 배열(1x3x4)을 하드코딩 해주세요.
[0]
2 4
1 5

[1]
2 3
3 6

[2]
7 3
1 5
```

- 그리고 숫자를 하나 입력 받고, max와 min값을 출력 해주세요.

## 2. 입력
- 첫 번째 줄: 숫자를 하나 입력 받는다.



## 3. 출력
- 해당하는 2차원 index 배열의 max와 min값을 출력 해주세요.

## 4. 예제 입력
```
0
```

## 5. 예제 출력
```
MAX=5
MIN=1
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int map[3][2][2] = {
    {
        2, 4,
        1, 5
    },
    {
        2, 3,
        3, 6
    },
    {
        7, 3,
        1, 5
    }
};

int main()
{
    int i;
    cin >> i;
    int max = -1, min = 100000;
    for (int j = 0; j < 2; j++) {
        for (int k = 0; k < 2; k++) {
            if (max < map[i][j][k]) max = map[i][j][k];
            if (min > map[i][j][k]) min = map[i][j][k];
        }
    }

    cout << "MAX=" << max << "\n";
    cout << "MIN=" << min;
}
```
