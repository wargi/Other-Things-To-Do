# 최단 거리 #

## 1. 문제
- 그래프와 출발점, 도착점이 주어질 때 출발점에서 도착점까지 이동하기 위한 최단거리를 출력하는 프로그램을 작성하시오.
- 예를 들어, 아래 그림에서 출발 정점이 0, 도착 정점이 10이라고 할 때, 최단거리는 3이다.

![image](https://user-images.githubusercontent.com/35207245/71363612-0596f200-25dd-11ea-9cfe-f5cd0410943f.png)

## 2. 입력

- 첫째 줄에 정점의 개수 N과 간선의 개수 M이 주어진다. ( 1 ≤ N ≤ 10,000, 1 ≤ M ≤ 1,000,000 )
- 둘째 줄부터 간선의 정보가 주어진다.
- 각 줄은 두 개의 숫자 a, b로 이루어져 있으며, 이는 정점 a와 정점 b가 연결되어 있다는 의미이다.
- M+1 번째 줄에 대하여 출발점과 도착점의 정점 번호가 주어진다.
- 정점의 번호는 0번부터 N-1번까지이다.

## 3. 출력
- 출발점에서 도착점까지 이동하기 위한 최단거리를 출력한다.

## 4. 예제 입력
```
11 14
0 1
0 2
1 2
1 4
1 5
2 3
3 7
4 7
4 9
4 10
5 6
6 8
6 10
7 8
0 10
```

## 5. 예제 출력
```
3
```

## 6. 코드

```c++
#include <stdio.h>
#include <vector>
#include <algorithm>

using namespace std;

const int MAX = 11000000;

vector <int>graph[MAX];
bool check[MAX];
int table[MAX];
int n, m, start, end2;

int main() {
  scanf("%d %d", &n, &m);
  
  for(int i = 0; i < m; i++) {
    int a, b;
    scanf("%d %d", &a, &b);
    
    graph[a].push_back(b);
    graph[b].push_back(a);
  }
  
  scanf("%d %d", &start, &end2);
  
  for(int i = 0; i < n; i++) {
    table[i] = 9999999;
    sort(graph[i].begin(), graph[i].end());
  }
  
  table[start] = 0;
  
  for(int i = 0; i < n; i++) {
    int minValue = 9999999, minIndex = -1;
    
    for(int j = 0; j < n; j++) {
      if(!check[j] && minValue > table[j]) {
        minValue = table[j];
        minIndex = j;
      }
    }
    
    check[minIndex] = true;
    
    for(int j = 0; j < graph[minIndex].size(); j++) {
      int node2 = graph[minIndex][j];
      if(table[node2] > table[minIndex] + 1) {
        table[node2] = table[minIndex] + 1;
      }
    }
  }
  
  printf("%d", table[end2]);
  
  return 0;
}
```
