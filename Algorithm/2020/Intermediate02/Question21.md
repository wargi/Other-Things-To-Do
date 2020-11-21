# 기차에서 가족 찾기

## 1. 문제

```
1차원 배열(1x8) 하드 코딩 해주세요.
3 7 6 4 2 9 1 7
```

- 가족 배열(1x3)을 입력받고, 자신의 가족이 기차에서 몇번부터 몇번째 칸에 탑승하고 있는지 출력하시오.

## 2. 입력

- 가족 배열(1x3)을 입력받아주세요.

## 3. 출력

- 자신의 가족이 기차에서 몇번부터 몇번째 칸에 탑승하고 있는지 출력하시오.

## 4. 입력 예시

```
7 6 4
```

## 5. 출력 예시

```
1번~3번 칸
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    int train[8] = { 3, 7, 6, 4, 2, 9, 1, 7 };
    int team[3];

    for (int j = 0; j < 3; j++) {
        cin >> team[j];
    }

    for (int i = 0; i < 6; i++) {
        int flag = 1;
        for (int j = 0; j < 3; j++) {
            if (team[j] != train[i + j]) {
                flag = 0;
                break;
            }
        }
        if (flag) {
            cout << i << "번~" << i + 2 << "번 칸";
            break;
        }
    }
}
```
