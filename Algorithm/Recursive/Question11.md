# High Digit Multiple

## 1. 문제

- 두 자연수가 주어질 때 그들의 곱셈을 계산하는 프로그램을 작성하시오.
- 각 수는 1 이상 10^100 미만의 범위를 가진다.  

## 2. 입력
- 첫 번째 줄과 두 번째 줄에 각각 하나의 자연수가 주어진다.  

## 3. 출력

- 첫 번째 줄에 곱셈의 결과를 출력한다.  


## 4. 예제 입력
```
123112981293812938139
1298928491101221811
```

## 5. 예제 출력
```
159914959026945386297336486942660549729
```

## 6. 코드

```c++
#include <stdio.h>
#include <string.h>

int main() {
  char a[1000], b[1000], tmp[1000], x[1000];
  int aSize, bSize, sum = 0, cnt = 1, count = 0;
  scanf("%s %s", a, b);
  aSize = strlen(a); bSize = strlen(b);
  char c[bSize][1000];
  
  for(int i = 0; i < bSize; i++) {
    for(int j = 0; j < 1000; j++) {
      c[i][j] = '0';
    }
  }
  
  for(int i = 0; i < bSize; i++) {
    int mok = 0;
    char t[1000];
    int ac = int(b[bSize - i - 1]) - 48;
    for(int j = 0; j < aSize; j++) {
      int temp = ac * (int(a[aSize - j - 1]) - 48);
      if(j == 0) {
        t[j] = char(temp % 10 + 48); 
        mok = temp / 10;
      } else if(j == aSize - 1) {
        int num = temp + mok;
        t[j] = char(num % 10 + 48);
        t[j+1] = char((num / 10) + 48);
      } else {
        int num = temp + mok;
        t[j] = char(num % 10 + 48);
        mok = num / 10;
      }
    }
    int tSize = strlen(t);
    for(int j = 0; j < 1000; j++) {
      if (i <= j && (j - i) < tSize) {
        c[i][j] = t[j-i];
      } else c[i][j] = '0';
    }
  }
  
  int mok = 0;
  for(int i = 0; i < 1000; i++) {
    int sum = 0;
    for(int j = 0; j < bSize; j++) {
      sum = sum + int(c[j][i] - '0');
    }
    sum += mok;
    tmp[i] = char((sum % 10) + 48);
    mok = sum / 10;
  }
  
  for(int i = 0; i < 1000; i++) {
    if(count == 0 && tmp[1000 - i - 1] != '0') {
      x[count] = tmp[1000 - i - 1];
      count++;
    } else if(count != 0) {
      x[count] = tmp[1000 - i - 1];
      count++;
    }
  }
  
  printf("%s", x);
  
  return 0;
}
```
