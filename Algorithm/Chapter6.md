# Maximum #

## 1. 문제
- 서로 다른 자연수가 주어질 때, 이들 중 최대값을 찾고 그 최대값이 몇 번째 수인지를 구하는 프로그램을 작성하시오

## 2. 입력
- 한 줄에 하나의 자연수가 주어진다. (0 ≤ n ≤ 100)

## 3. 출력
- 첫째 줄에 최대값을 출력하고, 둘째 줄에 최대값이 몇 번째 수인지를 출력한다.

## 4. 예제 입력
```
2
28
37
11
56
73
39
60
84
```

## 5. 예제 출력
```
84
9
```

## 6. 코드
```c++
#include <stdio.h>

int main() {

  int max = 0, maxIndex, i;
  
  int numArr[9];
  for(i = 0; i < 9; i++) {
    int a;
    scanf("%d", &a);
    numArr[i] = a;
  }
  //Please Enter Your Code Here
  for(i = 0; i < 9; i++) {
    if (max < numArr[i]) {
      max = numArr[i];
      maxIndex = i + 1;
    }
  }

  printf("%d\n%d", max, maxIndex);
  return 0;
}
```
