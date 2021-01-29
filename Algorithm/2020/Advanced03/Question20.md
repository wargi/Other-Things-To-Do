# 이미지 회전

## 1. 문제

- n, k를 입력받습니다.
- 그리고 사이즈가 nxn인 이미지 배열을 입력받습니다.
- 입력받은 이미지를 시계방향으로 k번 회전시켜주세요.
- 회전시킨 최종결과를 출력해주세요.

<img src="./Array01.png" alt="Array" style="zoom:80%;" />

## 2. 입력
- 첫 줄: n, k를 입력받습니다.
- 다음 줄부터: nxn인 이미지 배열을 입력받습니다.

## 3. 출력

- 회전시킨 최종결과를 출력해주세요.

## 4. 예제 입력

```
5 1
1 0 1 0 1
1 1 1 1 1
0 0 1 0 0
0 0 1 0 0
0 1 0 1 0
```

## 5. 예제 출력
```
0 0 0 1 1
1 0 0 1 0
0 1 1 1 1
1 0 0 1 0
0 0 0 1 1
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
    int y;
    int x;
};

int n, m;
int map[10][10];
Node direct[10][10];

void spin() {
    int temp[10][10] = { 0 };

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            int dy = i + direct[i][j].y;
            int dx = j + direct[i][j].x;

            temp[dy][dx] = map[i][j];
        }
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            map[i][j] = temp[i][j];
        }
    }
}

int main()
{
    cin >> n >> m;

    direct[0][0] = { 0, n - 1 };

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cin >> map[i][j];
            if (i == 0 && j == 0) continue;
            if (i > 0 && j == 0) direct[i][j] = { direct[i - 1][j].y - 1, direct[i - 1][j].x - 1 };
            else direct[i][j] = { direct[i][j - 1].y + 1, direct[i][j - 1].x - 1 };
        }
    }

    for (int i = 0; i < m; i++) {
        spin();
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cout << map[i][j] << " ";
        }
        cout << "\n";
    }

    return 0;
}
```
