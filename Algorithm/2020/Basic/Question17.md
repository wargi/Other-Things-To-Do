# 없는 숫자 찾기

## 1. 문제
- 9개 숫자를 입력받아, 2차원 배열(3x3)을 채워주세요.

- 배열을 탐색하여 1 ~ 9 까지의 숫자 중에 없는 숫자를 출력해주세요.



## 2. 입력
- 9개 숫자를 입력받아, 2차원 배열(3x3)을 채워주세요.

## 3. 출력
- 배열을 탐색하여 1 ~ 9 까지의 숫자 중에 없는 숫자를 출력해주세요.

## 4. 예제 입력
```
1 2 2
3 4 4
5 6 7
```

## 5. 예제 출력
```
8 9
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    int map[3][3];
    int check[10] = { 0 };

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            cin >> map[i][j];
            check[map[i][j]]++;
        }
    }

    for (int i = 1; i < 10; i++) {
        if (check[i] == 0) cout << i << " ";
    }
}
```
