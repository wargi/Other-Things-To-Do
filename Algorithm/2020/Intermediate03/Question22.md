# 내 주위 판별

## 1. 문제

- 2차원 배열(5x4)을 입력 받습니다.
- 입력 받은 배열의 내부에는 0과 1으로 구성 되어 있습니다. 그 중에 1을 찾아서 1의 주위 8칸이 모두 0이면 안정된 상태고, 
- 주변 8칸 중에 한칸이라도 1이라면 불안정한 상태로 출력해주세요.


## 2. 입력

- 2차원 배열(5x4)을 입력 받습니다.

## 3. 출력

- 1을 가진 좌표 주면 8칸 중에 한 칸이라도 1이라면 "불안정한 상태", 모두 0이라면 "안정된 상태"라고 출력해주세요.


## 4. 예제 입력
```
0 0 0 0
0 1 0 0
0 0 0 1
0 0 0 0
1 0 0 0
```

## 5. 예제 출력
```
안정된 상태
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int map[5][4];

int boom(int y, int x) {
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

    for (int i = 0; i < 8; i++) {
        int ny = y + direct[i][0];
        int nx = x + direct[i][1];
        if (ny >= 0 && ny < 5 && nx >= 0 && nx < 4 && map[ny][nx] == 1) return 0;
    }
    return 1;
}

int check() {
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 4; j++) {
            cin >> map[i][j];
        }
    }

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 4; j++) {
            if (map[i][j] == 1) {
                if (!boom(i, j)) return 0;
            }
        }
    }
    return 1;
}


int main()
{
    if (check()) cout << "안정된 상태";
    else cout << "불안정한 상태";
}
```
