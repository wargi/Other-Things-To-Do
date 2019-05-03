# Binary

## 1. 문제
- 숫자를 입력 받아 이진수로 출력하는 프로그램을 작성하시오.

## 2. 입력
- 첫 번째 줄: 숫자를 입력 받는다. 숫자의 크기는 1,000보다 작거나 같다.

## 3. 출력

- 첫째 줄에 숫자를 이진수로 바꾸어 출력한다.

## 4. 예제 입력
```
14
```

## 5. 예제 출력
```
1110
```

## 6. 예제 입력

```
31
```

## 7. 예제 출력

```
11111
```

## 8. 코드

```c++
#include <stdio.h>
int getBinary(int n) {
  if(n == 1) return 1;
  else {
    return (n%2) + (10 * getBinary(n/2));
  }
}

int main() {
  int num;
  scanf("%d", &num);
  
  printf("%d", getBinary(num));
  return 0;
}
```
