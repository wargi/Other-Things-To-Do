# High Digit Minus

## 1. 문제

- 두 자연수가 주어질 때 그들의 뺄셈을 계산하는 프로그램을 작성하시오.
- 각 수는 1 이상 10의 100승 미만의 범위를 가진다.  

## 2. 입력
- 첫 번째 줄: 두 번째 줄에 각각 하나의 자연수가 주어진다.  

## 3. 출력

- 첫 번째 줄에 뺄셈의 결과를 출력한다.  


## 4. 예제 입력
```
1962831868293922
2528838232
```

## 5. 예제 출력
```
1962829339455690
```

## 6. 예제 입력

```
18592918185
2195812983912895799129
```

## 7. 예제 출력

```
-2195812983894302880944
```

## 8. 코드

```c++
#include <stdio.h>
#include <string.h>

int main() {
  char a[1000], b[1000], min;
  int c[1000];
  int aSize, bSize, sum = 0, cnt = 0, max;
  scanf("%s %s", a, b);
  aSize = strlen(a); bSize = strlen(b);
  
  if(aSize > bSize) {
    max = aSize;
    min = '+';
    int minus = aSize - bSize;
    for(int i = 0; i < aSize; i++) {
      if(i < minus) c[i] = int(a[i] - '0');
      else c[i] = int(a[i] - b[i - minus]);
    }
  } else if(aSize < bSize){
    max = bSize;
    min = '-';
    int minus = bSize - aSize;
    for(int i = 0; i < bSize; i++) {
      if(i < minus) c[i] = int(b[i] - '0');
      else c[i] = int(b[i] - a[i - minus]);
    }
  } else if(strcmp(a,b) > 0) {
    max = aSize;
    min = '+';
    int minus = aSize - bSize;
    for(int i = 0; i < aSize; i++) {
      if(i < minus) c[i] = int(a[i] - '0');
      else c[i] = int(a[i] - b[i - minus]);
    }
  } else if(strcmp(a,b) < 0) {
    max = bSize;
    min = '-';
    int minus = bSize - aSize;
    for(int i = 0; i < bSize; i++) {
      if(i < minus) c[i] = int(b[i] - '0');
      else c[i] = int(b[i] - a[i - minus]);
    }
  } else {
    printf("0");
  }
  
  for(int i = max - 1; i > 0; i--) {
    if(c[i] < 0) {
      c[i] += 10;
      c[i-1] -= 1;
    }
  }
  
  if(min == '-') printf("-");
  
  for(int i = 0; i < max; i++) {
    if(c[i] != 0 && cnt == 0) {
      printf("%d", c[i]);
      cnt++;
    } else if(cnt != 0) {
      printf("%d", c[i]);
    }
  }
  
  return 0;
}
```
