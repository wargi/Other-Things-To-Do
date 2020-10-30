# 계단 내려가기 #

## 1. 문제

```
한 문장을 입력받고 역 순으로 아래의 예시처럼 계단 형식으로 출력해주세요.

input: HISWIFT

output)
T
FT
IFT
WIFT
SWIFT
ISWIFT
HISWIFT
```

## 2. 입력
- 문장 한 개를 입력받는다.

## 3. 출력
- 한 문장을 입력받고 역 순으로 아래의 예시처럼 계단 형식으로 출력해주세요.

## 4. 예제 입력
```
WARGI
```

## 5. 예제 출력
```
I
GI
RGI
ARGI
WARGI
```

## 6. 예제 입력

```
PARK
```

## 7. 예제 출력

```
K
RK
ARK
PARK
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
        for (int j = n - i - 1; j < n; j++) {
            cout << str[j];
        }
        cout << "\n";
    }
}
```
