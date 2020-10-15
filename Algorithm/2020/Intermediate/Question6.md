# 합격자 발표 2

## 1. 문제
- 아래의 2차원 배열(2x3)을 하드코딩하고, 1차원 배열(1x4)을 입력 받아 합격 여부를 출력해주세요.

```
3 5 1
4 2 6
```

## 2. 입력
- 1차원 배열(1x4)을 입력 받아주세요.

## 3. 출력
- 합격 여부를 출력해주세요.

## 4. 예제 입력
```
1 3 6 9
```

## 5. 예제 출력
```
1번 합격
2번 합격
6번 합격
9번 불합격
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    int win[2][3] = {
        3, 5, 1,
        4, 2, 6
    };

    int people[4];
    int check[100] = { 0 };
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            check[win[i][j]]++;
        }
    }

    for (int i = 0; i < 4; i++) {
        cin >> people[i];
    }

    for (int i = 0; i < 4; i++) {
        if (check[people[i]] > 0) cout << people[i] << "번 합격\n";
        else cout << people[i] << "번 불합격\n";
    }
}

```
