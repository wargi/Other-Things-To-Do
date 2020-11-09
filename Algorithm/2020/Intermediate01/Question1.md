# 문자에 '#' 넣기 #

## 1. 문제
- 문장 한 개와 문장에 포함되는 문자 2개를 입력 받습니다.
- 입력 받은 문자를 문장에서 찾아 문자의 좌우를 '#'으로 바꾸어주세요.

## 2. 입력
-  문장 한 개와 문장에 포함되는 문자 2개를 입력 받습니다.

## 3. 출력
- 입력 받은 문자를 문장에서 찾아 문자의 좌우를 '#'으로 바꾸어주세요.

## 4. 예제 입력
```
WARGI
R G
```

## 5. 예제 출력

```
W####
```

## 6. 코드

```c++
#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char str1[100];
    char result[100];
    char q, a;
    
    cin >> str1 >> q >> a;

    strcpy(result, str1);

    for (int i = 0; i < strlen(str1); i++) {
        if (str1[i] == q || str1[i] == a)
        {
            int dx = i - 1;
            int dx2 = i + 1;

            if (dx >= 0) result[dx] = '#';
            if (dx2 < strlen(str1)) result[dx2] = '#';
        }
    }

    for (int i = 0; i < strlen(str1); i++) cout << result[i];
}
```