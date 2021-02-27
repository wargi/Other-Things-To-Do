# DFS - 인접행렬 Tree

## 1. 문제
- 인접행렬(6x6)을 입력받고, DFS 탐색을 이용해 트리의 마지막 노드에 도착할 때 마다의 경로를 출력하는 프로그램을 작성하시오.



## 2. 입력
- A~F의 노드로 구성된 인접행렬 트리를 입력받습니다.

## 3. 출력
- DFS 탐색을 이용해 트리의 마지막 노드에 도착할 때 마다의 경로를 출력해주세요.

## 4. 예제 입력
```
0 1 1 0 0 0
0 0 0 1 1 1
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
```

## 5. 예제 출력

```
ABD
ABE
ABF
AC
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int map[6][6];
char path[7];
void dfs(int now, int level) {
    int flag = 1;
    for (int i = 0; i < 6; i++) {
        if (map[now][i] == 1) {
            path[level + 1] = 65 + i;
            dfs(i, level + 1);
            path[level + 1] = 0;
            flag = 0;
        }
    }

    if (flag) cout << path << "\n";
}

int main()
{
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 6; j++) {
            cin >> map[i][j];
        }
    }

    path[0] = 'A';
    dfs(0, 0);

    return 0;
}
```
