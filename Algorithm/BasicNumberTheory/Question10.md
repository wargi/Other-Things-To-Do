# Find Prime

## 1. 문제

- 주어진 숫자들 중 소수가 몇 개인지 찾아서 출력하는 프로그램을 작성하시오.  

## 2. 입력
- 첫 줄: 수의 개수 N이 주어진다.
- N은 100이하이다.
- 다음으로 N개의 줄에 걸쳐 N개의 수가 주어지는데 수는 1,000 이하의 자연수이다.

## 3. 출력

- 주어진 수들 중 소수의 개수를 출력한다.


## 4. 예제 입력
```
4
1
3
5
7
```

## 5. 예제출력

```
3
```

## 6. 코드

```c++
#include <stdio.h>

int main() {
  int size, cnt = 0, num;
  scanf("%d", &size);
  
  for(int i = 0; i < size; i++) {
    scanf("%d", &num);
    int count = 0;
    for(int j = 2; j < num; j++) {
      if(num % j == 0) break;
      count++;
    }
    if(count == (num - 2)) {
      cnt++;
    }
  }
  
  printf("%d", cnt);
  return 0;
}
```
