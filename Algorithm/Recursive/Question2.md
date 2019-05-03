# Case Conversion

## 1. 문제
- 문자열이 주어질 때, 대문자는 소문자로, 소문자는 대문자로 바꾸는 프로그램을 작성하시오. 알파벳이 아닌 문자는 그대로 유지한다. 

## 2. 입력
- 첫 번째 줄에 문자열이 주어진다. ( 1 ≤ 문자열의 길이 ≤ 1,000 )  

## 3. 출력

- 문자열 내의 대문자는 소문자로, 소문자는 대문자로 바꾼 결과를 출력한다.

## 4. 예제 입력
```
hELLO wORLD!
```

## 5. 예제 출력
```
Hello World!
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
    if(int(arr[i]) > 96 && int(arr[i]) < 123) arr[i] = int(arr[i] - 32);
    else if(int(arr[i]) > 64 && int(arr[i]) < 91) arr[i] = int(arr[i] + 32);
    printf("%c", arr[i]);
  }
  return 0;
}
```
