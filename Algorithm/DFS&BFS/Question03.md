# 이분 그래프 판별

## 1. 문제
- 이분 그래프란, 아래 그림과 같이 정점을 크게 두 집합으로 나눌 수 있는 그래프를 말한다.
- 여기서 같은 집합에 속한 정점끼리는 간선이 존재해서는 안된다.
- 예를 들어, 아래 그래프의 경우 정점을 크게 {1, 4, 5}, {2, 3, 6} 의 두 개의 집합으로 나누게 되면, 같은 집합에 속한 정점 사이에는 간선이 존재하지 않으므로 이분 그래프라고 할 수 있다.

![그림](./image/graph2.png)

- 그래프가 입력으로 주어질 때, 이 그래프가 이분그래프인지를 판별하는 프로그램을 작성하시오.

## 2. 입력

- 첫째 줄에 정점의 개수 N과 간선의 개수 M이 주어진다. ( 1 ≤ N ≤ 1,000, 1 ≤ M ≤ 100,000 )
- 둘째 줄부터 간선의 정보가 주어진다.
- 각 줄은 두 개의 숫자 a, b로 이루어져 있으며, 이는 정점 a와 정점 b가 연결되어 있다는 의미이다. (1 ≤ a, b ≤ N) 

## 3. 출력
- 주어진 그래프가 이분 그래프이면 Yes, 아니면 No를 출력한다.

## 4. 예제 입력
```
6 5
1 2
2 4
3 4
3 5
4 6
```

## 5. 예제 출력
```
Yes
```

## 6. 예제 입력

```
4 5
1 2
1 3
1 4
2 4
3 4
```

## 7. 예제 출력

```
No
```

## 6. 코드

```c++
#include <stdio.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;

const int MAX = 1000;

vector <int> arr[MAX];
queue <int> Queue;
int visited[MAX];
int n, m;

bool result = true;

void BFS() {
  Queue.push(1);
  visited[1] = 1;
  
  while(!Queue.empty()) {
    int current = Queue.front();
    Queue.pop();
    
    for(int i = 0; i < arr[current].size(); i++) {
      int next = arr[current][i];
      
      if(visited[next] == 0) {
        Queue.push(next);
        
        if(visited[current] == 1) {
          visited[next] = 2;
        } else {
          visited[next] = 1;
        }
      } else if(visited[next] == visited[current]) {
        result = false;
        break;
      }
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
  
  for(int i = 1; i <= n; i++) {
    sort(arr[i].begin(), arr[i].end());
  }
  
  BFS();

  if(result) {
    printf("Yes");
  } else {
    printf("No");
  }
  
  return 0;
}
```
