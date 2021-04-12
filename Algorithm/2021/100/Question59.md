# 사탕 게임

## 1. 문제

- 상근이는 어렸을 적에 "봄보니 (Bomboni)" 게임을 즐겨했다.
- 가장 처음에 N×N크기에 사탕을 채워 놓는다.
- 사탕의 색은 모두 같지 않을 수도 있다.
- 상근이는 사탕의 색이 다른 인접한 두 칸을 고른다.
- 그 다음 고른 칸에 들어있는 사탕을 서로 교환한다.
- 이제, 모두 같은 색으로 이루어져 있는 가장 긴 연속 부분(행 또는 열)을 고른 다음 그 사탕을 모두 먹는다.
- 사탕이 채워진 상태가 주어졌을 때, 상근이가 먹을 수 있는 사탕의 최대 개수를 구하는 프로그램을 작성하시오.

## 2. 입력
- 첫째 줄에 보드의 크기 N이 주어진다. (3 ≤ N ≤ 50)
- 다음 N개 줄에는 보드에 채워져 있는 사탕의 색상이 주어진다.
- 빨간색은 C, 파란색은 P, 초록색은 Z, 노란색은 Y로 주어진다.
- 사탕의 색이 다른 인접한 두 칸이 존재하는 입력만 주어진다.

## 3. 출력

- 첫째 줄에 상근이가 먹을 수 있는 사탕의 최대 개수를 출력한다.


## 4. 예제 입력
```
3
CCP
CCP
PPC
```

## 5. 예제출력

```
3
```

## 6. 예제 입력

```
4
PPPP
CYZY
CCPY
PPCC
```

## 7. 예제출력

```
4
```

## 8. 예제 입력

```
5
YCPZY
CYZZP
CCPPP
YCYZC
CPPZZ
```

## 9. 예제출력

```
4
```

## 10. 코드

```swift
#include <string>
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int direct[4][2] = {
    -1, 0,
    1, 0,
    0, -1,
    0, 1
};

int n;
string map[50];

int check() {

    int ret = 1;
    for (int i = 0; i < n; i++) {
        int rCnt = 1, cCnt = 1;

        for (int j = 0; j < n - 1; j++) {
            if (map[j][i] == map[j + 1][i]) rCnt++;
            else rCnt = 1;

            if (map[i][j] == map[i][j + 1]) cCnt++;
            else cCnt = 1;

            ret = max(ret, rCnt);
            ret = max(ret, cCnt);
        }
    }

    return ret;
}

int main() {
    cin >> n;

    for (int i = 0; i < n; i++) {
        cin >> map[i];
    }

    int ret = 1;
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n - 1; j++) {
            swap(map[i][j], map[i][j + 1]);
            ret = max(ret, check());
            swap(map[i][j], map[i][j + 1]);

            swap(map[j][i], map[j + 1][i]);
            ret = max(ret, check());
            swap(map[j][i], map[j + 1][i]);
        }
    }

    cout << ret;

    return 0;
}
```



### #출처

- [백준 온라인 저지](https://www.acmicpc.net/problem/3085)
