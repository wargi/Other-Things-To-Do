# High Digit Plus

## 1. 문제

- 두 자연수가 주어질 때 그들의 덧셈을 계산하는 프로그램을 작성하시오.
- 각 수는 1 이상 10^100(10의 100 거듭제곱) 미만의 범위를 가진다. 

## 2. 입력
- 첫 번째 줄과 두 번째 줄에 각각 하나의 자연수가 주어진다.  

## 3. 출력

- 첫 번째 줄에 덧셈의 결과를 출력한다.


## 4. 예제 입력
```
123112981293812938139
1298928491101221811
```

## 5. 예제 출력
```
124411909784914159950
```

## 6. 코드

```c++
#include <stdio.h>
#include <string.h>

int main() {
  char a[100], b[100], c[100];
  int aSize, bSize, sum = 0, cnt = 0, max;
  scanf("%s %s", a, b);
  aSize = strlen(a); bSize = strlen(b);
  
  if(aSize >= bSize) max = aSize;
  else max = bSize;
  
  c[aSize + 1] = '\0';
  for(int i = 1; ; i++) {
    if(max - i + 1 <= 0 && sum == 0) break;
    if(aSize - i > -1 && bSize - i > -1) sum += int(a[aSize - i]) + int(b[bSize - i]) - 96;
    else if(aSize - i > -1) sum += int(a[aSize - i]) - 48;
    else if(bSize - i > -1) sum += int(b[bSize - i]) - 48;
    c[i - 1] = 48 + (sum % 10);
    sum = sum / 10;
    cnt = i;
  }
  
  for(int i = 0; i < cnt; i++) {
    printf("%c", c[cnt - i - 1]);
  }
  
  return 0;
}
```
