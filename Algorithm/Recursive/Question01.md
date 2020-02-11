# Exponentiation

## 1. 문제

- 거듭제곱을 구하라.

## 2. 입력
- 첫 번째 줄: 두개의 숫자가 주어진다. ( 1 ≤ n, m ≤ 1,000 )  
- n: 곱할 정수, m: 지수

## 3. 출력

- 거듭제곱의 결과를 출력하라,.


## 4. 예제 입력
```
3 5
```

## 5. 예제 출력
```
243
```

## 6. 코드

```c++
#include <stdio.h>

int getPower(int n, int m) {
  if(m == 0) return 1;
  else return getPower(n, m-1) * n;
}

int main() {
  int n, m;
  
  scanf("%d %d", &n, &m);
  printf("%d\n",getPower(n, m));
  
  return 0;
}
```
