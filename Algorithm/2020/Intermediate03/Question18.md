# 가장 큰 좌표 찾기

## 1. 문제

```
아래의 map배열을 하드코딩 해주세요.
3 3 5 3 1
2 2 4 2 6
4 9 2 3 4
1 1 1 1 1
3 3 5 9 2
```

- x,y좌표를 입력 받고, sum(int y, int x) 함수를 만들어 좌표의  대각선 위(왼쪽, 오른쪽) 대각선 아래(왼쪽, 오른쪽)를 더해서 결과를 리턴해주는 함수를 만들고, 하드코딩한 좌표 중에 가장 큰 값이 나오는 좌표를 출력해주세요.

## 2. 출력
- 가장 큰 결과 값을 리턴 해주는 좌표(y, x)를 출력

## 3. 예제 출력
```
3 2
```

## 4. 코드
```c++
#include <iostream>
using namespace std;

int sum(int y, int x) {
    int map[5][5] = {
        3, 3, 5, 3, 1,
        2, 2, 4, 2, 6,
        4, 9, 2, 3, 4,
        1, 1, 1, 1, 1,
        3, 3, 5, 9, 2
    };

    int direct[4][2] = {
        -1, -1,
        -1, 1,
        1, -1,
        1, 1
    };

    int sum = 0;
    for (int t = 0; t < 4; t++) {
        int ny = y + direct[t][0];
        int nx = x + direct[t][1];

        if (ny >= 0 && ny < 5 && nx >= 0 && nx < 5) sum += map[ny][nx];
    }
    
    return sum;
}

int main()
{
    int max = -1, maxX, maxY;

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            int temp = sum(i, j);
            if (max < temp) {
                max = temp;
                maxY = i;
                maxX = j;
            }
        }
    }

    cout << maxY << " " << maxX;
}
```
