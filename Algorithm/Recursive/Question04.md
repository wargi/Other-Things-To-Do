# Palindrome

## 1. 문제
- 재귀함수를 이용하여 문자열이 주어질 때, 이것이 팰린드롬인지 조사하는 프로그램을 작성하시오.
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

bool isPalindrome(char myString[], int start, int end) {
  if(start >= end) return true;
  else {
    if(myString[start] == myString[end]) {
      return isPalindrome(myString, start + 1, end - 1);
    } else return false;
  }
}

int main() {

  char myString[1000];
  
  scanf("%s", myString);
  int length = strlen(myString);
  
  if(isPalindrome(myString, 0, length - 1)) {
    printf("Yes");
  } else {
    printf("No");
  }
  
  return 0;
}
```
