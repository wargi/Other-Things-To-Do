# 큰 수 3개 구하기

## 1. 문제

- 첫 줄에 2차원 배열의 사이즈 row, col을 입력받습니다.
- 그 후에, 배열 값을 입력받고, 배열에서 가장 큰 값 3개를 찾아서 좌표와 함께 출력하는 프로그램을 작성해주세요.

## 2. 입력

- 첫 줄에 2차원 배열의 사이즈 row, col을 입력받고,
- 그 후에, 배열 값을 입력받습니다.

## 3. 출력
- 배열에서 가장 큰 값 3개를 찾아서 좌표와 함께 출력해주세요.

## 4. 예제 입력
```
3 4
1 5 2 7
1 5 1 6
3 3 2 4
```

## 5. 예제 출력
```
7(0,3)
6(1,3)
5(0,1)
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

struct Node {
    int y, x;
    int data;
};

int main()
{
    int map[100][100] = { 0 };
    int n, m;

    cin >> n >> m;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            cin >> map[i][j];
        }
    }

    Node nodes[3] = { { 0, 0, -1 }, { 0, 0, -1 }, { 0, 0, -1 } };

    for (int x = 0; x < 3; x++) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                if (nodes[x].data < map[i][j]) {
                    nodes[x].y = i;
                    nodes[x].x = j;
                    nodes[x].data = map[i][j];
                }
            }
        }
        map[nodes[x].y][nodes[x].x] = -1;
    }

    for (int i = 0; i < 3; i++) {
        cout << nodes[i].data << "(" << nodes[i].y << "," << nodes[i].x << ")\n";
    }
    
    return 0;
}
```
