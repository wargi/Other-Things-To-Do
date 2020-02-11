# 2색 칠하기

## 1. 문제
- 2색 칠하기란, 다음 두 조건을 만족하면서 그래프의 정점을 모두 색칠할 수 있는지 묻는 문제이다.
- 2개의 색이 존재한다.
- 인접한 두 정점은 색깔이 다르다.
- 그래프가 주어질 때, 2색 칠하기가 가능한지 출력하는 프로그램을 작성하시오.
- 예를 들어, 아래의 그래프는 2색 칠하기가 가능한 그래프이며, 정점을 색칠한 결과는 다음과 같다.

![graph](https://user-images.githubusercontent.com/35207245/70919422-2eab0600-2064-11ea-832a-9be7aa572219.png)

## 2. 입력

- 첫째 줄에 정점의 개수 N과 간선의 개수 M이 주어진다. ( 1 ≤ N ≤ 10,000, 1 ≤ M ≤ 100,000 )
- 둘째 줄부터 간선의 정보가 주어진다.
- 각 줄은 두 개의 숫자 a, b로 이루어져 있으며, 이는 정점 a와 정점 b가 연결되어 있다는 의미이다.(0 ≤ a, b ≤ N-1)

## 3. 출력
- 주어진 그래프에 대하여 2색 칠하기를 할 수 있으면 YES, 할 수 없으면 NO를 출력한다.

## 4. 예제 입력
```
9 10
0 1
0 2
0 3
1 5
2 5
3 4
5 6
5 8
6 7
7 8
```

## 5. 예제 출력
```
YES
```

## 6. 예제 입력

```
9 11
0 1
0 2
0 3
1 5
2 5
3 4
4 5
5 6
5 8
6 7
7 8
```

## 7. 예제 출력

```
NO
```

## 8. 코드

```c++
#include <stdio.h>
#include <iostream>
#include <queue>
#include <algorithm>
#include <vector>

using namespace std;

const int MAX = 10000;

vector <int> arr[MAX];
queue <int> graph;
int check[MAX];
bool result = true;
int n, m;

void BFS() {
  
  graph.push(0);
  check[0] = 1;
  
  while(!graph.empty()) {
    int current = graph.front();
    graph.pop();
    
    for(int i = 0; i < arr[current].size(); i++) {
      int y = arr[current][i];
      
      if(check[y] == 0) {
        graph.push(y);
        if (check[current] == 1) {
          check[y] = 2;
        } else {
          check[y] = 1;
        }
      } else {
        if(check[current] == check[y]) {
          result = false;
          break;
        }
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
  
  BFS();
  
  if (result) {
    printf("YES");
  } else {
    printf("NO");
  }
  
  return 0;
}
```
