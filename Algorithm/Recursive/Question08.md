# 거듭 제곱 구하기 L

## 1. 문제

- n과 m이 주어질 때, n의 m승을 구하는 프로그램을 작성하시오.
- 단, n의 m승의 값이 커질 수 있기 때문에, 정답을 10,007 으로 나눈 나머지를 출력한다.

## 2. 입력
- 첫 번째 줄에 숫자 n과 m이 주어진다.
- ( 1 ≤ n ≤ 100, 1 ≤ m ≤ 1,000,000,000,000,000,000 )  

## 3. 출력

- 첫째 줄에 n의 m승을 10,007 으로 나눈 나머지를 출력한다.


## 4. 예제 입력
```
3 4
```

## 5. 예제 출력
```
81
```

## 6. 코드

```c++
#include <stdio.h>

long long int pow(long long int n, long long int m) {
  if (m == 1) return n;
  long long int x = pow(n, m/2);
  long long int temp;
  
  if ((m % 2) == 1) {
    temp = n * x * x % 10007;
  } else {
    temp = x * x % 10007;
  }
  
  return temp;
}


int main() {
  long long int n;
  long long int m;
  
  scanf("%lld %lld", &n, &m);
  printf("%lld", pow(n, m));
  
  return 0;
}
```
