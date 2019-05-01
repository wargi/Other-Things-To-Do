# Flip The String

## 1. 문제

- 문자열이 주어질 때, 이를 뒤집어서 출력하는 프로그램을 작성하시오.  

## 2. 입력
- 첫 번째 줄: 문자열이 주어진다. ( 1 ≤ 문자열의 길이 ≤ 1,000 )  

## 3. 출력

- 문자열을 뒤집은 결과를 출력한다.


## 4. 예제 입력
```
Hello World!
```

## 5. 예제 출력
```
!dlroW olleH
```

## 6. 코드

```c++
#include <stdio.h>
#include <string.h>

int main() {

  char arr[1000];
  fgets(arr,1000,stdin);
  int size = strlen(arr);

  for(int i = 0; i < size; i++) {
    printf("%c", arr[size - i - 1]);
  }
  return 0;
}
```
