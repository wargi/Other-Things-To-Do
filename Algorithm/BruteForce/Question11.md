# Attack Range

## 1. 문제
- 윤성이는 어렸을 적부터 수없이 몰려오는 적으로부터 기지를 방어하는 디펜스 유형의 게임을 플레이하는 것을 좋아했다.
- 그래서 간단한 디펜스 게임을 만들어 보려고 한다.
- 당신은 윤성이를 도와, 디펜스 게임 내에서 플레이어가 설치하는 유닛의 사거리를 나타내는 기능을 구현하면 된다.  

## 2. 입력
- 첫째 줄: 디펜스 게임의 맵 크기 N이 주어딘다.
- 맵은 N×N 크기의 2차원 형태이다. (6 <= N(짝수) <= 100)
- 둘째 줄: 유닛이 설치될 위치 X, Y와 유닛의 사거리 R이 주어진다. (R은 N/2이하의 자연수)
- X는 행의 번호, Y는 열의 번호 (1 <= X, Y <= N)

## 3. 출력
- 예제 출력과 같이 유닛의 사거리를 나타내어 출력한다.
- 유닛의 사거리가 아무리 길어도 맵을 벗어날 수는 없다.

## 4. 예제 입력
```
8
4 5 3
```

## 5. 예제 출력
```
0 0 0 0 3 0 0 0
0 0 0 3 2 3 0 0
0 0 3 2 1 2 3 0
0 3 2 1 x 1 2 3
0 0 3 2 1 2 3 0
0 0 0 3 2 3 0 0
0 0 0 0 3 0 0 0
0 0 0 0 0 0 0 0
```

## 6. 예제 입력

```
6
2 3 3
```

## 7. 예제 출력

```
3 2 1 2 3 0
2 1 x 1 2 3
3 2 1 2 3 0
0 3 2 3 0 0
0 0 3 0 0 0
0 0 0 0 0 0
```

## 8. 코드

```c++
#include <stdio.h>

int main() {
  int size, unitX, unitY, range;
  
  scanf("%d", &size);
  int map[size][size];
  scanf("%d %d %d", &unitX, &unitY, &range);
  
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      map[i][j] = 0;
      // top
      if(unitX - 2 == i && unitY - 1 == j) {
        map[i][j] = 1;
      }
      // bottom
      if(unitX == i && unitY - 1 == j) {
        map[i][j] = 1;
      }
      // left
      if(unitX - 1 == i && unitY - 2 == j) {
        map[i][j] = 1;
      }
      // right
      if(unitX - 1 == i && unitY == j) {
        map[i][j] = 1;
      }
    }
  }
  
  for(int k = 2; k <= range; k++) {
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        // top
        if(map[i][j] != 0 && map[i-1][j] == 0 && i - 1 >= 0 && map[i][j] != k) {
          map[i-1][j] = k;
        }
        // bottom
        if(map[i][j] != 0 && map[i+1][j] == 0 && i + 1 < size && map[i][j] != k) {
          map[i+1][j] = k;
        }
        // left
        if(map[i][j] != 0 && map[i][j-1] == 0 && j - 1 >= 0 && map[i][j] != k) {
          map[i][j-1] = k;
        }
        // right
        if(map[i][j] != 0 && map[i][j+1] == 0 && j + 1 < size && map[i][j] != k) {
          map[i][j+1] = k;
        }
      }
    }
  }
  
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      if(i == unitX -1 && j == unitY - 1) {
        printf("x ");
        continue;
      }
      printf("%d ", map[i][j]);
    }
    printf("\n");
  }
  return 0;
}
```
