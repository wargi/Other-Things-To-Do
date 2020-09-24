# 알파벳 찾기

## 1. 문제
- 아래의 배열처럼 2차 배열을 하드코딩 해주세요.

```
R L F
Q K E
P J D
O I C
N H B
M G A
```

- 그리고, 좌표(y, x)를 입력받고, 해당하는 곳의 알파벳을 출력해주세요.

## 2. 입력
- 좌표(y, x)로 두 개의 숫자를 입력받는다.

## 3. 출력
- 해당하는 좌표의 알파벳을 출력해주세요.

## 4. 예제 입력
```
2 0
```

## 5. 예제 출력
```
P
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    char alpha[6][3];
    char start = 'A';

    for (int i = 2; i >= 0; i--) {
        for (int j = 5; j >= 0; j--) {
            alpha[j][i] = char(start++);
        }
    }

    int n, m;
    cin >> n >> m;

    cout << alpha[n][m];
}
```
