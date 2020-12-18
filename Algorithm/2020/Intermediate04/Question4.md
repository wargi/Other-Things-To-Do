# DFS 2 #

## 1. 문제
- 8개의 노드로 구성 된 문자열을 입력받고, 8x8의 인접행렬을 입력받아 주세요.
- 아래의 그림은 예제 입력의 예시에 해당하는 트리입니다.
- DFS로 0번 노드부터 모든 노드를 탐색하고 출력해주세요.

<img src="./Tree04.png" alt="Tree" style="zoom:80%;" />

## 2. 입력
- 8개의 노드로 구성 된 문자열을 입력받고, 8x8의 인접행렬을 입력받아 주세요.

## 3. 출력
- DFS로 0번 노드부터 모든 노드를 탐색하고 출력해주세요.

## 4. 예제 입력
```
RKFCBICM
0 1 1 1 0 0 0 0
0 0 0 0 1 1 0 0 
0 0 0 0 0 0 0 0
0 0 0 0 0 0 1 1
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
```

## 5. 예제 출력
```
RKBIFCCM
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int n;
int map[100][100];
string names;

void input() {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cin >> map[i][j];
        }
    }
}

void run(int row) {
    cout << names[row];

    for (int i = 0; i < n; i++) {
        if (map[row][i] == 1) run(i);
    }
}

int main()
{
    cin >> names;
    n = names.size();

    input();

    run(0);

    return 0;
}
```
