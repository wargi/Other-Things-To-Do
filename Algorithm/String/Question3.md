# Spoil The Assignment

## 1. 문제

- 철수는 영희를 괴롭히는 것을 매우 좋아한다.
- 오늘도 철수는 영희를 어떻게 괴롭힐지 고민을 하다가, 영희가 최근에 작성하고 있던 문서가 떠올랐다.
- 이에 철수는 영희의 문서를 망쳐놓기로 결심한다.
- 바로 띄어쓰기를 모두 제거해버리는 것이다.
- 영희의 문서를 확인한 철수는, 띄어쓰기가 너무 많아 직접 모두 제거할 수는 없다는 것을 깨닫고 도움을 요청했다.
- 영희의 문서가 주어질 때, 띄어쓰기를 모두 제거하는 프로그램을 작성하시오.

## 2. 입력
- 첫째 줄: 영희의 문서가 주어진다.
- 영희의 문서는 한 줄 짜리 문자열이며, 문서의 길이는 100,000을 넘지 않는다.  

## 3. 출력

- 문자열의 띄어쓰기를 모두 제거한 결과를 출력한다.


## 4. 예제 입력
```
Please do not touch anything
```

## 5. 예제 출력
```
Pleasedonottouchanything
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
    if(arr[i] == ' ') continue;
    printf("%c", arr[i]);
  }
  return 0;
}
```
