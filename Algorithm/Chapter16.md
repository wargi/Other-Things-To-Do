# Offset

## 1. 문제
- 5x5 2차원 배열이 주어질 때 어떤 원소가 상하좌우에 있는 원소보다 작을 때 해당 위치에 * 을 표시하는 프로그램을 작성하시오.
- 경계선에 있는 수는 상하좌우 중 존재하는 원소만을 비교한다.

## 2. 입력
- 5x5 행렬의 정보가 25 개의 수로 주어진다.
- 각 수는 0 에서 9 사이 수이다.

## 3. 출력
- *를 포함한 행렬을 출력예의 형식으로 출력한다.

## 4. 예제 입력
```
3 4 1 4 9
2 9 4 5 8
9 0 8 2 1
7 0 2 8 4
2 7 2 1 4
```

## 5. 예제 출력
```
3 4 * 4 9 
* 9 4 5 8 
9 0 8 2 * 
7 0 2 8 4 
* 7 2 * 4 
```

## 6. 코드
```c++
#include <stdio.h>

int main() {
  int stopNumber, i ,j, cnt;
  int numArr[5][5];

  for(i = 0; i < 5; i++) {
    for(j = 0; j < 5; j++) {
      scanf("%d", &numArr[i][j]);
    }
  }
  
  for(i = 0; i < 5; i++) {
    for(j = 0; j < 5; j++) {
      cnt = 0;
      // Top
      if (i != 0) {
        
        if (numArr[i][j] < numArr[i-1][j]) cnt++;
      }
      // Bottom
      if (i != 4) {
        if (numArr[i][j] < numArr[i+1][j]) cnt++;
      }
      // Left
      if (j != 0) {
        if (numArr[i][j] < numArr[i][j-1]) cnt++;
      }
      // Right
      if (j != 4) {
        if (numArr[i][j] < numArr[i][j+1]) cnt++;
      }
      
      if((i == 0 || i == 4) && (j == 0 || j == 4)) {
        if (cnt == 2) {
          printf("* ");
        } else {
          printf("%d ", numArr[i][j]);
        }
      } else if(i == 0 || j == 0 || i == 4 || j == 4) {
        if (cnt == 3) {
          printf("* ");
        } else {
          printf("%d ", numArr[i][j]);
        }
      } else {
        if (cnt == 4) {
          printf("* ");
        } else {
          printf("%d ", numArr[i][j]);
        }
      }
    }
    printf("\n");
  }

  return 0;
}
```
