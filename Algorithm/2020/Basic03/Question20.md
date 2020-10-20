# 알파벳 정렬하기

## 1. 문제

```
아래의 2차원 배열(5x3)을 하드코딩 해주세요.
A B C
A G H
H I J
K A B
A B C
```

- 위의 하드코딩한 배열을 사전순으로 정렬하여 출력해주세요.

## 2. 힌트
- Direct Address Table을 이용하여 풀어주세요.

## 3. 출력

- 위의 하드코딩한 배열을 사전순으로 정렬하여 출력해주세요.

## 4. 예제 출력
```
AAAABBBCCGHHIJK
```

## 5. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char alpha[5][4] = {
        "ABC",
        "AGH",
        "HIJ",
        "KAB",
        "ABC"
    };

    int check[1000] = { 0 };

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 3; j++) {
            check[alpha[i][j]]++;
        }
    }

    for (int i = 0; i < 1000; i++) {
        if (check[i] > 0) {
            for (int j = 0; j < check[i]; j++) {
                cout << char(i);
            }
        }
    }
}
```
