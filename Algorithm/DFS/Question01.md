# 깊이 우선 탐색 #

## 1. 문제
- 그래프가 주어질 때, 0번 정점을 시작으로 하여 깊이우선탐색과 너비우선탐색의 결과를 출력하는 프로그램을 작성하시오. 단, 노드를 방문할 때는 노드 번호가 작은 순서대로 방문한다고 하자.

## 2. 입력

- 첫째 줄에 정점의 개수 N과 간선의 개수 M이 주어진다. (1 ≤ N ≤ 1,000, 1 ≤ M ≤ 100,000 )
- 둘째 줄부터 간선의 정보가 주어진다.
- 각 줄은 두 개의 숫자 a, b로 이루어져 있으며, 이는 정점 a와 정점 b가 연결되어 있다는 의미이다.
- 정점의 번호는 0번부터 N-1번까지이다.

## 3. 출력
- 깊이우선탐색 결과를 출력한다.

## 4. 예제 입력
```
9 12
0 1
0 2
0 3
1 5
2 5
3 4
4 5
5 6
5 7
5 8
6 7
7 8
```

## 5. 예제 출력
```
0 1 5 2 4 3 6 7 8
```

## 6. 코드

```c++
#include <stdio.h>
#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

const int MAX = 10000;

int n, m;
bool visited[MAX];
bool visitedY[MAX];
vector <int> arr[MAX];

void DFS(int x) {
  printf("%d ", x);
  visited[x] = true;
  
  for(int i = 0; i < arr[x].size(); i++) {
    int y = arr[x][i];
    
    if(visited[y] == false) {
      DFS(y);
    }
  }
}

int main() {
  scanf("%d %d", &n, &m);
  
  for(int i = 0; i < m; i++) {
    int o, p;
    scanf("%d %d", &o, &p);
    
    arr[o].push_back(p);
    arr[p].push_back(o);
  }
  
  for(int i = 0; i < n; i++) {
    sort(arr[i].begin(), arr[i].end());
  }
  
  DFS(0);
  
  return 0;
}
```
