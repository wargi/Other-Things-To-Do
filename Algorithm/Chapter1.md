# Triangle Output 1 #

## 1. 문제
- n층의 삼각형을 출력하는 프로그램을 작성하여라. Input, Output의 예제를 참고한다.

## 2. 입력
- 첫째 줄에 정수n이 주어진다. (0≤n≤100)

## 3. 출력
- 다음 예제와 같이 삼각형 모양으로 ‘*’을 출력한다.

## 4. 예제 입력
```
3
```

## 5. 예제 출력
```
*
**
***
```

## 6. 예제 입력
```
6
```

## 7. 예제 출력
```
*
**
***
****
*****
******
```

## 8. 코드
```c++
#include <stdio.h>

int main() {

  int a, i, j;
  scanf("%d", &a);
  
  //Please Enter Your Code Here
  for(i = 0; i < a; i++) {
    for(j = 0; j <= i; j++) {
      printf("*");
    }
    printf("\n");
  }

  return 0;
}
```
