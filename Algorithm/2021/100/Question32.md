# 별 찍기 - 5

## 1. 문제
- 첫째 줄에는 별 1개, 둘째 줄에는 별 3개, ..., N번째 줄에는 별 2×N-1개를 찍는 문제
- 별은 가운데를 기준으로 대칭이어야 한다.

## 2. 입력
- 첫째 줄에 N(1 ≤ N ≤ 100)이 주어진다.

## 3. 출력

- 첫째 줄부터 N번째 줄까지 차례대로 별을 출력한다.

## 4. 예제 입력
```
5
```

## 5. 예제 출력
```
    *
   ***
  *****
 *******
*********
```

## 6. 코드

```c++
#include <stdio.h>

int main() {

  int a, i, j;
  scanf("%d", &a);
  
  //Please Enter Your Code Here
  for(i = 0; i < a; i++) {
    for(j = 0; j < a + i; j++) {
      if (j >= (a - i - 1)) {
        printf("*");
        continue;
      }
      printf(" ");
    }
    printf("\n");
  }
  
  return 0;
}
```
