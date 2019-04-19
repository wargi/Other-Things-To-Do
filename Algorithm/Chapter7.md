# Second Minimum #

## 1. 문제
- 두 번째 최소값이 몇 번째 수인지를 구하는 프로그램을 작성하시오. 

## 2. 입력
- 한 줄에 하나의 자연수가 주어진다. (0 ≤ n ≤ 10,000,000)

## 3. 출력
- 첫째 줄에 두 번째 최소값을 출력하고, 둘째 줄에 두 번째 최소값이 몇 번째 수인지를 출력한다.

## 4. 예제 입력
```
2
28
37
56
11
73
39
84
60
```

## 5. 예제 출력
```
11
5
```

## 6. 코드
```c++
#include <stdio.h>

int main() {

  int i, j;
  
  int numArr[9];
  int secMin, secIndex;
  
  for(i = 0; i < 9; i++) {
    int a;
    scanf("%d", &a);
    numArr[i] = a;
  }
  //Please Enter Your Code Here
  for(i = 0; i < 9; i++) {
    int count = 0;
    for(j = 0; j < 9; j ++) {
      if (numArr[i] > numArr[j] && i != j) {
        count += 1;
      }
    }
    if (count == 1) {
      secMin = numArr[i];
      secIndex = i+1;
    }
  }

  printf("%d\n%d", secMin, secIndex);
  return 0;
}
```
