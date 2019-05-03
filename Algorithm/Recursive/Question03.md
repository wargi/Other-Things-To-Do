# Sum Of Each Digit

## 1. 문제

- 재귀함수를 이용하여 각 자릿수의 합을 구해보자.

## 2. 입력
- 첫 번째 줄: 한개의 정수가 주어진다.

## 3. 출력

- 주어진 정수의 각 자릿수의 합을 출력하자.


## 4. 예제 입력
```
12345
```

## 5. 예제출력

```
15
```

## 6. 코드

```c++
#include <stdio.h>

int getDigitSum(int x) {
  if(x < 10) return x;
  else return (x % 10) + getDigitSum(x / 10);
  
}

int main() {
  int x;
  
  scanf("%d", &x);
  printf("%d\n", getDigitSum(x));
  return 0;
}
```
