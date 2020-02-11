# 미로 찾기

## 1. 문제
- 아래와 같이 이동할 수 있는 길, 그리고 이동할 수 없는 벽으로 이루어진 크기 N x M 의 지도가 주어진다.
- 이 때, (N-1, 0) 에서 출발하여 (0, M-1) 까지 도착하는 최단거리를 출력하는 프로그램을 작성하시오.
- 아래 그림에 대하여 S에서 E까지 가는 최단거리는 22이다.

![미로](https://user-images.githubusercontent.com/35207245/71300626-debc9e00-23d9-11ea-9e64-4be7ea7c7757.png)

## 2. 입력

- 첫째 줄에 지도의 세로 길이 N과 지도의 가로 길이 M이 주어진다. ( 1 ≤ N, M ≤ 1,000 )
- 둘째 줄부터 지도의 정보가 주어진다.
- 0은 이동할 수 있는 부분, 1은 이동할 수 없는 부분을 나타낸다.

## 3. 출력
- (N-1, 0) 에서 출발하여 (0, M-1) 까지 이동하는 데 필요한 최단거리를 출력한다.

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
22
```

## 6. 코드

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
int visited[MAX][MAX];
int arr[MAX][MAX];
int n, m;
int nextXArr[4] = {0, 0, 1, -1};
int nextYArr[4] = {1, -1, 0, 0};

int main() {
  scanf("%d %d", &n, &m);
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < m; j++) {
      scanf("%d", &arr[i][j]);
    }
  }

  queueX.push(n-1);
  queueY.push(0);
  visited[n-1][0] = 1;

  while(!queueX.empty()) {
    int currentX = queueX.front();
    int currentY = queueY.front();
    queueX.pop();
    queueY.pop();
    

    for(int i = 0; i < 4; i++) {
      int nx = currentX + nextXArr[i];
      int ny = currentY + nextYArr[i];
      
      if(nx > -1 && nx < n && ny > -1 && ny < m) {
        if(visited[nx][ny] == 0 && arr[nx][ny] == 0) {
          queueX.push(nx);
          queueY.push(ny);
          visited[nx][ny] = visited[currentX][currentY] + 1;
        }
      }
    }

  }
  printf("%d", visited[0][m-1] - 1);

  return 0;
}
```
