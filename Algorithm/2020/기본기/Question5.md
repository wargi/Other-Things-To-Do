# GCD LCM #

## 1. 문제
- 두 개의 자연수를 입력받아 최대공약수(GCD)와 최소공배수(LCM)를 출력하는 프로그램을 작성하시오.  

## 2. 입력
- 첫째 줄: 두 개의 자연수가 주어진다.
- 이 둘은 10,000 이하의 자연수이며 사이에 한 칸의 공백이 주어진다.

## 3. 출력
- 첫째 줄에는 입력으로 주어진 두 수의 최대공약수를, 둘째 줄에는 입력으로 주어진 두 수의 최소공배수를 출력한다.

## 4. 예제 입력
```
24 18
```

## 5. 예제 출력
```
6
72
```

## 6. 코드
```c++
#include <stdio.h>

int main() {

  int a, b, i, cntGCD, cntLCM;
  
  scanf("%d %d", &a, &b);
  
  for(i = 1; i <= a; i++ ) {
    if (a % i == 0 && b % i == 0) {
      cntGCD = i;
    }
  }
  
  i = 1;
  while(true) {
    
    if((a * i) % b == 0) {
      i = a * i;
      break;
    }
    i++;
  }
  
  printf("%d\n", cntGCD);
  printf("%d", i);

  return 0;
}
```
