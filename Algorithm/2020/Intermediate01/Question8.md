# 같은 문장 판별 #

## 1. 문제
- 세 문장을 입력받고, 모두 같은 문장이면 "WON", 두문장이 같으면 "GOOD", 모두 다르면 "BAD"를 출력해주세요.

## 2. 입력
- 세 문장을 입력받는다.

## 3. 출력
- 모두 같은 문장이면 "WON", 두문장이 같으면 "GOOD", 모두 다르면 "BAD"를 출력해주세요.

## 4. 예제 입력
```
abcd
efgh
hijk
```

## 5. 예제 출력
```
BAD
```

## 6. 예제 입력

```
HELLO
SWIFT
HELLO
```

## 7. 예제 출력

```
GOOD
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char strings[3][11];

    for (int i = 0; i < 3; i++) cin >> strings[i];

    int max = -1;
    for (int i = 0; i < 3; i++) {
        int cnt = 0;
        for (int j = 0; j < 3; j++) {
            if (i == j) continue;
            if (!strcmp(strings[i], strings[j])) cnt++;
        }
        if (max < cnt) max = cnt;
    }

    if (max == 2) cout << "WOW";
    else if (max == 1) cout << "GOOD";
    else cout << "BAD";
}
```
