# Palindrome Survey

## 1. 문제
- 문자열이 주어질 때, 이것이 팰린드롬인지 조사하는 프로그램을 작성하시오.
- 팰린드롬이란, 앞으로 읽을 때와 뒤로 읽을 때의 결과가 같은 문자열을 말한다.  

## 2. 입력
- 첫 번째 줄: 문자열이 주어진다. ( 1 ≤ 문자열의 길이 ≤ 1,000 )  

## 3. 출력

- 입력된 문자열이 팰린드롬이면 YES, 아니면 NO를 출력한다.

## 4. 예제 입력
```
abcba
```

## 5. 예제 출력
```
YES
```

## 6. 예제 입력

```
abcbd
```

## 7. 예제 출력

```
NO
```

## 8. 코드

```c++
#include <stdio.h>
#include <string.h>

int main() {
  char a[1000], b[1000];
  bool flag = true;
  
  scanf("%s", a);
  int size = strlen(a);
  
  for(int i = 0; i < size; i++) {
    b[i] = a[size - i - 1];
  }
  
  for(int i = 0; i < size; i++) {
    if(a[i] != b[i]) flag = false;
  }
  
  if(flag) printf("YES");
  else printf("NO");

  return 0;
}
```
