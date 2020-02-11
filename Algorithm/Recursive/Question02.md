# N to M

## 1. 문제

- 재귀함수를 이용해 N부터 M까지 더하자.

## 2. 입력
- 첫 번째 줄: n과 m이 주어진다 ( 1 ≤ n, m ≤ 100,000 )

## 3. 출력

- n부터 m까지 더한 값을 출력하라.


## 4. 예제 입력
```
1 4
```

## 5. 예제 출력
```
10
```

## 6. 코드

```c++
#include <stdio.h>

int getSum(int n, int m) {
  if(m == n) return n;
  else return m + getSum(n, m-1);
}

int main() {
  int n, m;
  
  scanf("%d %d", &n, &m);
  printf("%d\n",getSum(n, m));
  
  return 0;
}
```
