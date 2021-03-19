# DFS와 BFS

## 1. 문제

- 그래프를 DFS로 탐색한 결과와 BFS로 탐색한 결과를 출력하는 프로그램을 작성하시오.
- 단, 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문하고, 더 이상 방문할 수 있는 점이 없는 경우 종료한다.
- 정점 번호는 1번부터 N번까지이다.

## 2. 입력
- 첫째 줄에 정점의 개수 N(1 ≤ N ≤ 1,000), 간선의 개수 M(1 ≤ M ≤ 10,000), 탐색을 시작할 정점의 번호 V가 주어진다.
- 다음 M개의 줄에는 간선이 연결하는 두 정점의 번호가 주어진다.
- 어떤 두 정점 사이에 여러 개의 간선이 있을 수 있다.
- 입력으로 주어지는 간선은 양방향이다.

## 3. 출력

- 첫째 줄에 DFS를 수행한 결과를, 그 다음 줄에는 BFS를 수행한 결과를 출력한다.
- V부터 방문된 점을 순서대로 출력하면 된다.


## 4. 예제 입력
```
4 5 1
1 2
1 3
1 4
2 4
3 4
```

## 5. 예제 출력
```
1 2 4 3
1 2 3 4
```

## 6. 예제 입력

```
5 5 3
5 4
5 2
1 2
3 4
3 1
```

## 7. 예제 출력

```
3 1 2 5 4
3 1 4 2 5
```

## 8. 예제 입력

```
1000 1 1000
999 1000
```

## 9. 예제 출력

```
1000 999
1000 999
```

## 10. 코드

```c++
#include <iostream>
using namespace std;

int n, m, k;
int check[1001] = { 0 };
int map[1001][1001] = { 0 };

void dfs(int now) {
    cout << now << " ";

    for (int i = 1; i <= n; i++) {
        if (map[now][i] == 1 && !check[i]) {
            check[i] = 1;
            dfs(i);
        }
    }
}

int main()
{
    
    cin >> n >> m >> k;

    for (int i = 0; i < m; i++) {
        int y, x;
        cin >> y >> x;
        map[y][x] = 1;
        map[x][y] = 1;
    }

    check[k] = 1;
    dfs(k);
    cout << "\n";

    int vect[1001] = { 0 };
    int head = 0, tail = 1;
    vect[0] = k;

    int checkBFS[1001] = { 0 };
    checkBFS[k] = 1;
    while (head != tail) {
        int now = vect[head++];

        for (int i = 1; i <= n; i++) {
            if (checkBFS[i] == 1) continue;
            if (map[now][i] == 1) {
                checkBFS[i] = 1;
                vect[tail++] = i;
            }
        }
    }


    for (int i = 0; i < head; i++) cout << vect[i] << " ";
}
```
