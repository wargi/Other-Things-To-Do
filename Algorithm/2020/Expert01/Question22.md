# 벌집

## 1. 문제

- 시골집에 벌들이 너무 많이 증식하여 골치를 앓고 있습니다.
- 아무리 사냥을 하더라도, 그들의 단합력과 강한 번식력으로 벌의 개체수가 줄지않습니다.
- 마을 이장님은 수 많은 벌들 중, 세력이 가장 강한 벌들을 없애려고 합니다. 
- 4 x 9 벌집이 입력 됩니다.
- 벌집안의 숫자들은 벌 들의 종류를 나타냅니다.
- 이장님은, 같은 숫자가 가장 많이 인접해 있는 곳이, 벌들의 세력이 가장 강한 곳임을 알아 내셨습니다.  (상하좌우가 같은 숫자들이 몰려있는 것이 하나의 세력입니다.)
- 같은 종류의 벌들이 가장 많이 몰려있는 곳을 찾아, 개체의 수와 그 숫자를 알아낸 뒤, 두 숫자를 곱한 값을 출력해 주세요.
-  <img src="./Array24.png" alt="Array.png" style="zoom:77%;" />


## 2. 입력

- 4 X 9 맵이 입력 됩니다.

## 3. 출력

- 연속으로 붙어있는 숫자가 가장 많은 곳을 찾아, 개체의 수와 써있는 숫자를 곱한 값을 출력하세요.
- 위 예시에서는 숫자 2가 7개 있으므로, 정답은 14 입니다.


## 4. 예제 입력
```
0 1 2 1 4 8 3 1 3
2 3 2 3 4 2 3 1 3
2 2 2 3 4 3 4 3 3
0 2 1 3 4 2 1 3 2
```

## 5. 예제 출력
```
14
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

struct Node {
    int y, x;
    int level;
};

int map[4][9];
int visited[4][9] = { 0, };
int maxCount = 0, maxValue = 0;

int direct[4][2] = { -1, 0, 1, 0, 0, -1, 0, 1 };

int bfs(int y, int x, int value) {
    int head = 0, tail = 1;

    visited[y][x] = 1;
    Node arr[100] = { { y, x, 1 }, };

    while (head != tail) {
        Node now = arr[head++];

        for (int t = 0; t < 4; t++) {
            int dy = now.y + direct[t][0];
            int dx = now.x + direct[t][1];

            if (dy < 0 || dx < 0 || dy >= 4 || dx >= 9) continue;
            if (visited[dy][dx]) continue;
            if (map[dy][dx] != value) continue;
            
            visited[dy][dx] = 1;
            arr[tail++] = { dy, dx, now.level + 1 };
        }
    }

    return tail;
}

int main()
{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 9; j++) {
            cin >> map[i][j];
        }
    }

    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 9; j++) {
            if (visited[i][j]) continue;
            int temp = bfs(i, j, map[i][j]);

            if (temp > maxCount) {
                maxCount = temp;
                maxValue = map[i][j];
            }
        }
    }

    cout << maxCount * maxValue;
}

```
