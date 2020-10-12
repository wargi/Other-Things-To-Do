# 층 수 찾기

## 1. 문제

- 아래 2차원 배열(5x3)을 하드 코딩 해주세요.

  ```
  15 18 17
  4 6 9
  10 1 3
  7 8 9
  15 2 6
  ```
  
- 입력받은 세 개의 숫자가 몇 번째 층인지 출력하시오.


## 2. 입력

- 첫 번째 줄: 숫자 세 개가 주어진다.

## 3. 출력

- 입력한 세 개의 숫자가 몇 번째 층인지 출력하시오.


## 4. 예제 입력
```
4 6 9
```

## 5. 예제 출력
```
4층
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int input[3];

int isSame(int n[3]) {
    for (int i = 0; i < 3; i++) {
        if (input[i] != n[i]) return 0;
    }
    return 1;
}

int main()
{
    int map[5][3] = {
        15, 18, 17,
        4, 6, 9,
        10, 1, 3,
        7, 8, 9,
        15, 2, 6
    };

    for (int i = 0; i < 3; i++) {
        cin >> input[i];
    }

    for (int i = 0; i < 5; i++) {
        if (isSame(map[i])) {
            cout << 5 - i << "층";
            break;
        }
    }
}

```
