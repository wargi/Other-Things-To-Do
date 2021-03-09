# 블랙 리스트

## 1. 문제
```
빌딩 배열(3x3)을 하드코딩 해주세요.
C D A
B M Z
Q P O
```

- 블랙 리스트 네 명을 입력받고, 빌딩 배열에 몇 명의 블랙 리스트가 있는지 출력해주세요.

## 2. 입력
- 블랙 리스트 네 명을 입력 받습니다.

## 3. 출력
- 빌딩 배열에 몇 명의 블랙 리스트가 있는지 출력해주세요.

## 4. 예제 입력
```
A R M C
```

## 5. 예제 출력
```
3명
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char town[3][4] = {
        "CDA",
        "BMZ",
        "QPO"
    };

    int check[1000] = { 0 };
    char black[5];

    for (int i = 0; i < 4; i++) {
        cin >> black[i];
        check[black[i]]++;
    }

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            check[town[i][j]]++;
        }
    }

    int cnt = 0;
    for (int i = 0; i < 1000; i++) {
        if (check[i] == 2) cnt++;
    }

    cout << cnt << "명";
}
```
