# 고스트 찾기

## 1. 문제
- 한 문장을 입력 받고, GHOST가 있는지 찾아보고 있으면, "존재", 없다면 "존재하지 않음"을 출력해주세요.

## 2. 입력
- 한 문장을 입력 받는다.

## 3. 출력
- GHOST가 있는지 찾아보고 있으면, "존재", 없다면 "존재하지 않음"을 출력해주세요.

## 4. 예제 입력
```
AQGHOSTW
```

## 5. 예제 출력
```
존재
```

## 6. 예제 입력

```
QWERHOSTT
```

## 7. 예제 출력

```
존재하지 않음
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char ghost[6] = { "GHOST" };
    char input[100];
    int check[100] = { 0 };
    cin >> input;

    int n = strlen(input);

    for (int i = 0; i < n; i++) check[input[i]]++;

    int flag = 1;
    for (int i = 0; i < 5; i++) {
        if (check[ghost[i]] != 1) {
            flag = 0;
            break;
        }
    }

    if (flag) cout << "존재";
    else cout << "존재하지 않음";
}
```
