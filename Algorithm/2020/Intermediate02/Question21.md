# path 출력하기

## 1. 문제

- 아래와 같은 트리를 만들고 level을 입력받고, level에 도달하였을 때, path를 출력해주세요.

<img src="./Tree01.png" alt="Tree" style="zoom:80%;" />

## 2. 입력

- n을 입력받아주세요. (2 <= level <= 4)

## 3. 출력

- path를 출력해주세요.

## 4. 입력 예시

```
2
```

## 5. 출력 예시

```
BB
BG
BT
BK
GB
GG
GT
GK
TB
TG
TT
TK
KB
KG
KT
KK
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

char ch[5] = "BGTK";
char map[1000];

void path(int x, int end) {
    if (x == end) {
        cout << map << "\n";
        return;
    }
    for (int i = 0;i < 4; i++) {
        map[x] = ch[i];
        path(x + 1, end);
    }
}

int main()
{
    int n;
    cin >> n;
    path(0, n);
}
```
