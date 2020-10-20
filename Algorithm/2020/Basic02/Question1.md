# 인기투표 #

## 1. 문제
```
아래의 2차원 배열(3x3)을 하드코딩 해주세요.
3 7 4
2 2 4
2 2 5
```

## 2. 입력
-  숫자 세 개를 하나의 1차원 배열에 입력받아 주세요.

## 3. 출력
- 입력 받은 숫자들 중 하드코딩한 배열에 각 각 몇 개가 있는지 체크하고 그 중 가장 많은 숫자를 출력해주세요

## 4. 예제 입력
```
2 3 4
```

## 5. 출력

```
2
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    int vect[3][3] = {
        3, 7, 4,
        2, 2, 4,
        2, 2, 5
    };

    int check[1000] = { 0 };
    int target[3];

    cin >> target[0];
    cin >> target[1];
    cin >> target[2];

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            check[vect[i][j]]++;
        }
    }

    if (check[target[0]] >= check[target[1]] && check[target[0]] >= check[target[2]]) cout << target[0];
    else if (check[target[1]] >= check[target[0]] && check[target[1]] >= check[target[2]]) cout << target[1];
    else cout << target[2];
}
```