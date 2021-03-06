# 목수의 미로 탈출

## 1. 문제
- 아래와 같이 이동할 수 있는 길, 그리고 이동할 수 없는 벽으로 이루어진 크기 N x M 의 지도가 주어진다.
- 이 때, (N-1, 0) 에서 출발하여 (0, M-1) 까지 도착하는 최단거리를 찾으려 한다.
- 그런데 목수는 도끼 하나를 갖고 있으며, 이 도끼를 이용하여 벽을 깨부술 수 있다.
- 하지만 이 도끼는 내구성이 그렇게 좋지 않기 때문에, 벽을 최대 1개밖에 깰 수 없다.
- 목수가 출발점에서 도착점까지 이동하기 위한 최단거리를 출력하는 프로그램을 작성하시오.
- 물론, 벽은 최대 1개까지 깰 수 있다.
- 아래 예제의 경우 ‘X’ 로 표시된 벽을 깰 경우 거리 18만에 출발점에서 도착점으로 이동할 수 있다.

## 2. 입력

- 첫째 줄에 지도의 세로 길이 N과 지도의 가로 길이 M이 주어진다. ( 1 ≤ N, M ≤ 1,000 )
- 둘째 줄부터 지도의 정보가 주어진다.
- 0은 이동할 수 있는 부분, 1은 이동할 수 없는 부분을 나타낸다.

## 3. 출력
- 목수가 (N-1, 0) 에서 출발하여 (0, M-1) 까지 이동하는 데 필요한 최단거리를 출력한다.
- 목수는 미로를 항상 탈출할 수 있다고 가정한다.

## 4. 예제 입력
```
10 10
0 0 0 0 0 0 1 1 0 0
0 1 1 1 0 0 1 0 1 0 
0 1 1 1 0 0 1 0 1 0
0 0 0 0 0 0 0 0 1 0
0 0 1 1 1 1 0 0 1 0
0 0 0 0 0 0 1 1 0 0
0 0 1 1 1 0 1 1 0 0
0 0 1 1 1 0 0 0 0 0 
0 0 0 0 0 1 1 1 0 0
0 0 0 0 0 0 0 1 0 0
```

## 5. 예제 출력
```
18
```

## 6. 예제 입력

```
10 10
0 0 0 0 0 0 1 1 0 0
0 1 1 1 0 0 1 1 1 0
0 1 1 1 0 0 1 1 1 0
0 0 0 0 0 0 0 1 1 0
0 0 1 1 1 1 0 1 1 0
0 0 0 0 0 0 1 1 0 0
0 0 1 1 1 0 1 1 0 0
0 0 1 1 1 0 0 1 0 0
0 0 0 0 0 1 1 1 1 1
0 0 0 0 0 0 0 1 0 0
```

## 7. 예제 출력

```
22
```

## 8. 코드

```c++
#include <stdio.h>
#include <algorithm>
#include <iostream>
#include <queue>
#include <vector>

using namespace std;


const int MAX = 1100;

queue <int> queueX;
queue <int> queueY;
queue <bool> isBreak;
int visited[MAX][MAX];
bool check[MAX][MAX];
bool bCheck[MAX][MAX];
int map[MAX][MAX];
int nextXArr[4] = {1, 0, -1, 0};
int nextYArr[4] = {0, -1, 0, 1};
int n, m;

int main() {
  scanf("%d %d", &n, &m);
  
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < m; j++) {
      scanf("%d", &map[i][j]);
    }
  }
  
  queueX.push(n-1);
  queueY.push(0);
  check[n-1][0] = true;
  isBreak.push(false);
  visited[n-1][0] = 1;
  
  while(!visited[0][m-1]) {
    int currentX = queueX.front();
    int currentY = queueY.front();
    int currentBreak = isBreak.front();
    queueX.pop();
    queueY.pop();
    isBreak.pop();
    
    for(int i = 0; i < 4; i++) {
      int nx = currentX + nextXArr[i];
      int ny = currentY + nextYArr[i];
      if(nx > -1 && nx < n && ny > -1 && ny < m) {
        if(currentBreak) {
          if(!check[nx][ny] && !bCheck[nx][ny] && map[nx][ny] == 0) {
            queueX.push(nx);
            queueY.push(ny);
            isBreak.push(true);
            visited[nx][ny] = visited[currentX][currentY] + 1;
            bCheck[nx][ny] = true;
          }
        } else {
          if(!check[nx][ny]) {
            if(map[nx][ny]) {
              isBreak.push(true);
            } else {
              isBreak.push(false);
            }
            queueX.push(nx);
            queueY.push(ny);
            visited[nx][ny] = visited[currentX][currentY] + 1;
            check[nx][ny] = true;
          }
        }
      }
    }
  }
  
  printf("%d", visited[0][m-1] - 1);

  return 0;
}
```
