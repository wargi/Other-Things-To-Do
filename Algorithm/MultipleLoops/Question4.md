# Prime Number

## 1. 문제
- 자연수n,m이 주어질 때, n부터m까지 존재하는 소수를 모두 출력하는 프로그램을 작성하여라. 
- 여기서 소수란, 약수가 1과 자기자신밖에 존재하지 않는 수를 말한다.

## 2. 입력
- 첫째 줄에 자연수 n, m이 주어진다. (1 ≤ n, m ≤ 20,000)

## 3. 출력
- 첫째 줄에 n부터m까지 존재하는 소수를 모두 출력한다.

## 4. 예제 입력
```
1 10
```

## 5. 예제 출력
```
2 3 5 7
```

## 6. 예제 입력
```
13 30
```

## 7. 예제 출력
```
13 17 19 23 29
```

## 8. 코드
```c++
#include <stdio.h>

int main() {
  int a, b, i, j;
  scanf("%d %d", &a, &b);
  
  //Please Enter Your Code Here
  for(i = a; i <= b; i++) {
    int isSosu = 0;
    for(j = 1; j <= i; j++) {
      if (i % j == 0) {
        isSosu += 1;
      }
    }
    if (isSosu == 2) printf("%d ", i);
  }
  
  return 0;
}
```
