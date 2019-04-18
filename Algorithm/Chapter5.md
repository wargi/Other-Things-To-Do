# Output in Reverse #

## 1. 문제
- 정수를 입력으로 받아 입력 받은 수를 거꾸로 출력하는 문제이다.

## 2. 입력
- 입력의 첫 수는 수의 개수 n 이다. ( 1 <= n <= 1000 ) 
- 다음 줄에는 수들이 입력으로 주어진다. 각 수의 범위는 -10000 < n < 10000 이다.

## 3. 출력
- 한 줄에 입력받은 수를 거꾸로 출력한다.

## 4. 예제 입력
```
5
1 2 3 4 5
```

## 5. 예제 출력
```
5 4 3 2 1
```

## 6. 예제 입력
```
8
1 -2 3 4 6 8 2 1
```

## 7. 예제 출력
```
1 2 8 6 4 3 -2 1
```

## 8. 코드
```c++
#include <stdio.h>

int main() {

  int n, i;
  scanf("%d", &n);
  
  int numArr[n];
  for(i = 0; i < n; i++) {
    int a;
    scanf("%d", &a);
    numArr[i] = a;
  }
  //Please Enter Your Code Here
  for(i = 0; i < n; i++) {
    printf("%d ", numArr[n-i-1]);
  }

  return 0;
}
```
