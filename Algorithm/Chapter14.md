# Array 3 #

## 1. 문제
- N이 주어질 때, 다음과 같은 프로그램을 작성해보자.  

## 2. 입력
- 첫째 줄: 자연수 N이 주어진다.( 1 <= N <= 100 )

## 3. 출력
- 예시를 참고하여 작성하자.

## 4. 예제 입력
```
3
```

## 5. 예제 출력
```
1 2 4
3 5
6 
```

## 6. 예제 입력

```
5
```

## 7. 예제 출력

```
1 2 4 7 11
3 5 8 12 
6 9 13 
10 14
15 
```

## 8. 코드

```c++
#include <stdio.h>

int main() {

  int i, j, n, count = 0;
  
  scanf("%d", &n);
  int numArr[n][n];

  for(i = 0; i < n; i++) {
    for(j = 0; j <= i; j++) {
      count += 1;
      if (j == 0) {
        numArr[j][i] = count;
      } else {
        numArr[j][i-j] = count;
      }
    }
  }
  
  for(i = 0; i < n; i++) {
    for(j = 0; j < n - i; j++) {
      printf("%d ", numArr[i][j]);
    }
    printf("\n");
  }
  return 0;
}
```
