# 완벽하게 다른 문장 찾기 #

## 1. 문제

```
아래의 1차원 배열(1x4)을 하드코딩 해주세요.
3 5 4 2
```

- 세 문장을 입력 받고, 세 문장 모두 같은 글자가 한글자라도 없으면 "Perfect", 아니면 "No"를 출력해 주세요.

## 2. 입력
- 문장 세 개를 입력받는다.

## 3. 출력
- 입력받은 세 문장 모두 같은 글자가 한글자라도 없으면 "Perfect", 아니면 "No"를 출력해 주세요.

## 4. 예제 입력
```
PARK
SANG
WOOK
```

## 5. 예제 출력
```
No
```

## 6. 예제 입력

```
HELLO
SWIFT
2020
```

## 7. 예제 출력

```
Perfect
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char ca[100], cb[100], cc[100];
    cin >> ca >> cb >> cc;

    int n = strlen(ca);
    int m = strlen(cb);
    int o = strlen(cc);

    int check[100] = { 0 };

    for (int i = 0; i < n; i++) {
        check[ca[i]]++;
    }

    for (int i = 0; i < n; i++) {
        check[cb[i]]++;
    }

    for (int i = 0; i < n; i++) {
        check[cc[i]]++;
    }

    int flag = 1;
    for (int i = 0; i < 100; i++) {
        if (check[i] > 1) {
            flag = 0;
            break;
        }
    }

    if (flag) cout << "Perfect";
    else cout << "No";
}
```
