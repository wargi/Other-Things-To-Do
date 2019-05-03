# Factorial

## 1. 문제

- N 팩토리얼 (N!)은 1부터 N까지의 곱으로 정의된다.
- 예를 들어
  - 3! = 1 x 2 x 3 = 6
  - 4! = 1 x 2 x 3 x 4 = 24 이다.
- N이 주어질 때, N!을 계산하는 프로그램을 작성하시오.  

## 2. 입력
- 첫 번째 줄: 숫자 N이 주어진다. ( 1 ≤ N ≤ 10 )  

## 3. 출력

- 첫째 줄에 N!을 출력한다.


## 4. 예제 입력
```
4
```

## 5. 예제출력

```
24
```

## 6. 코드

```c++
#include <stdio.h>

int factorial(int n) {
  if(n == 1) return 1;
  else return n * factorial(n - 1);
}

int main() {
  int num;
  scanf("%d", &num);
  printf("%d", factorial(num));
  return 0;
}
```
