# 중복 제거 2

## 1. 문제

- 2차원 배열(3x3)을 입력 받아 주세요.
- 입력 받은 배열에서 중복은 제거 한 알파벳을 사전순으로 출력해주세요.

## 2. 입력
- 2차원 배열(3x3)을 입력 받아 주세요.

## 3. 출력

- 입력 받은 배열에서 중복은 제거 한 알파벳을 사전순으로 출력해주세요.


## 4. 예제 입력
```
ATK
AAA
TTG
```

## 5. 예제 출력
```
AGKT
```

## 6. 예제 입력

```
BBB
BCD
DZZ
```

## 7. 예제 출력

```
BCDZ
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

struct Sketchbook {
    char image[3][4];
};

int main()
{
    int dat[100] = { 0 };
    Sketchbook s1;

    for (int i = 0; i < 3; i++) {
        cin >> s1.image[i];
    }

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            dat[s1.image[i][j]]++;
        }
    }

    for (int i = 0; i < 100; i++) {
        if (dat[i] > 0) cout << char(i);
    }
}

```
