# 마스크 배열의 비어있는 곳 찾기

## 1. 문제

```
2차원 배열(4x4) 2개를 하드 코딩 해주세요.
1) 
0 0 0 1  
1 1 0 1     
1 0 0 1     
1 1 1 1     

2)
1 1 1 1
1 0 1 1
1 0 0 0
1 0 0 0
```

## 2. 출력

- 하드 코딩한 두 배열을 합치고 비어있는 곳의 좌표를 출력해주세요.

## 3. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    int vect1[4][4] = {
        0, 0, 0, 1,
        1, 1, 0, 1,
        1, 0, 0, 1,
        1, 1, 1, 1
    };

    int vect2[4][4] = {
        1, 1, 1, 1,
        1, 0, 1, 1,
        1, 0, 0, 0,
        1, 0, 0, 0
    };

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
            if (vect1[i][j] == 0 && vect2[i][j] == 0) {
                printf("(%d,%d)\n", i, j);
            }
        }
    }
}
```
