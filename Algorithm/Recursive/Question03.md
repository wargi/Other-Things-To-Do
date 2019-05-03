# Investigate String Containment Relationship

## 1. 문제

- 문자열 A와 B가 주어질 때, 문자열 B가 문자열 A에 포함되어 있는지를 조사하는 프로그램을 작성하시오.
- 단, 문자열 A와 B에는 알파벳으로만 이루어져 있으며, 공백은 포함되지 않는다고 가정한다.  

## 2. 입력
- 첫 번째 줄: 문자열 A, 두 번째줄에 문자열 B가 주어진다.
- 각각의 길이는 1,000을 넘지 않는다.  

## 3. 출력

- 문자열 B가 문자열 A에 포함되면 YES, 아니면 NO를 출력한다.


## 4. 예제 입력
```
Watermelon
melon
```

## 5. 예제출력

```
YES
```

## 6. 코드

```c++
#include <stdio.h>
#include <string.h>

int main() {
  bool isSame = false;
  char strA[1000];
  char strB[1000];
  
  scanf("%s %s", strA, strB);
  
  int sizeA = strlen(strA);
  int sizeB = strlen(strB);
  
  for(int i = 0; i <= sizeA - sizeB; i++) {
    bool flag = true;
    for(int j = 0; j < sizeB; j++) {
      if (strA[i+j] != strB[j]) {
        flag = false;
        break;
      }
    }
    if(flag) isSame = true;
  }
  
  if(isSame) {
    printf("YES");
  } else {
    printf("NO");
  }
  
  return 0;
}
```
