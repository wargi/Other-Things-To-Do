# 계단 내려가기 3 #

## 1. 문제
```
문장을 입력 받고, 아래의 예시 처럼 계단식으로 출력해주세요.
ex)
input: WARGI

output)
W
WA
WAR
WARG
WARGI
```

## 2. 입력
- 문장을 입력 받습니다.

## 3. 출력
- 위의 예시 처럼 계단식으로 출력해주세요.

## 4. 예제 입력
```
HELLO
```

## 5. 예제 출력
```
H
HE
HEL
HELL
HELLO
```

## 6. 예제 입력

```
HI
```

## 7. 예제 출력

```
H
HI
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char str[11];
    cin >> str;

    int n = strlen(str);

    for (int i = 0; i < n; i++) {
        for (int j = 0; j <= i; j++) {
            cout << str[j];
        }
        cout << "\n";
    }
}
```
