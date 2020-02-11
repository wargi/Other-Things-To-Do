# Combination Pascal

## 1. 문제

- n명의 사람중 m명을 순서에 상관없이 뽑는 경우의 수를 조합이라고 하며 nCm으로 나타낸다.
- 이 조합은 파스칼의 삼각형과 아주 밀접한 관련이 있다고 한다.
- n과 m이 주어졌을때 nCm의 값을 출력하는 프로그램을 작성하시오. 

## 2. 입력
- 첫째 줄: 정수 n, m (0 ≤ m ≤ n ≤ 30)

## 3. 출력

- 첫째 줄에 nCm의 값을 출력한다


## 4. 예제 입력
```
5 2
```

## 5. 예제 출력
```
10
```

## 6. 코드

```c++
#include <stdio.h>

int main() {
  int n, m;
  scanf("%d %d", &n, &m);
  int pascal[n + 1][n * 2];
  
  for(int i = 0; i <= n; i++) {
    for(int j = 0; j < i * 2 + 1; j++) {
      pascal[i][j] = 0;
    }
  }
  
  for(int i = 0; i < n + 1; i++) {
    for(int j = 0; j < i + 1; j++) {
      if(i == n && j > m) break;
      if(j == 0 || j == i) {
        pascal[i][j] = 1;
      } else {
        pascal[i][j] = pascal[i-1][j] + pascal[i-1][j-1];
      }
    }
  }

  printf("%d", pascal[n][m]);
  return 0;
}
```
