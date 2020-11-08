# A to B

## 1. 문제

```
2차원 배열(4x3)을 입력 받고, A, B가 적혀있습니다.
A와 B를 찾아서 위,아래,왼쪽,오른쪽 몇칸 떨어져 있는지 출력합니다.
```

## 2. 입력

- 2차원 배열(4x3)을 입력 받습니다.

## 3. 출력

- A와 B를 찾아서 위,아래,왼쪽,오른쪽 몇칸 떨어져 있는지 출력합니다.

## 4. 예제 입력

```
AWR
ZOT
YPB
XQU
```

## 5. 예제 출력

```
4
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    char str[4][4];

    for (int i = 0; i < 4; i++) cin >> str[i];
    
    int lx, ly, rx, ry;

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            if (str[i][j] == 'A')
            {
                ly = i;
                lx = j;
            }

            if (str[i][j] == 'B')
            {
                ry = i;
                rx = j;
            }
        }
    }

    if (lx + ly >= rx + ry) cout << lx + ly - rx - ry;
    else cout << rx + ry - lx - ly;

}
```
