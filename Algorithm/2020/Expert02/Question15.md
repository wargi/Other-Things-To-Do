# 2차원 배열 돌리기 #

## 1. 문제
```
1. 2차원 배열(3x3)을 두개(a, b)를 입력 받습니다.
A: 1 1 1   1 2 3
   2 2 2   1 2 3
   3 3 3   1 2 3

2. a배열을 왼쪽으로 몇 번 회전시켜야 b배열과 같은지 출력하는 프로그램을 작성하시오.

ex)

1회 회전 상태)
1 2 3
1 2 3
1 2 3

1회 회전후 b배열과 같으므로 1을 출력한다.
```

## 2. 입/출력
- 입력: 2차원 배열(3x3)을 두개(a, b)를 입력 받습니다.
- 출력: a배열을 왼쪽으로 몇 번 회전시켜야 b배열과 같은지 출력해주세요.

## 3. 예제 입력
```
1 1 1
2 2 2
3 3 3

1 2 3
1 2 3
1 2 3
```

## 4. 예제 출력
```
1
```

## 5. 코드
```c++
#include <iostream>
using namespace std;

struct Node {
    int x, y;
};

int a[3][3], b[3][3];
int direct[9][2] = {
    2, 0,
    1, -1,
    0, -2,
    1, 1,
    0, 0,
    -1, -1,
    0, 2,
    -1, 1,
    -2, 0
};

void getLeft() {
    int cnt = 0;
    int temp[3][3];

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            int dy = i + direct[cnt][0];
            int dx = j + direct[cnt++][1];

            temp[dy][dx] = a[i][j];
        }
    }

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            a[i][j] = temp[i][j];
        }
    }
}

bool getSame() {
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (a[i][j] != b[i][j]) return false;
        }
    }
    return true;
}

int main()
{
    for (int x = 0; x < 2; x++) {
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (!x) cin >> a[i][j];
                else cin >> b[i][j];
            }
        }
    }

    int r = 0;
    while (true) {
        r++;
        getLeft();
        if (getSame()) break;
    }

    cout << r;

    return 0;
}
```
