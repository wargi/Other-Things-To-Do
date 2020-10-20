# 카드 종류 #

## 1. 문제
- 카드 배열(1x11)을 입력받고 몇 가지 종류의 카드가 있는지 출력해주세요.

## 2. 힌트
- DAT(Direct Address Table)을 이용해보자.

## 3. 입/출력
- 11개의 문자를 입력받고, 몇 가지의 종류가 있는지 출력한다.

## 4. 예제 입력
```
ABCDACABCDE
```

## 5. 예제 출력
```
5개
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char cardList[16];
    int check[1000] = { 0 };
    cin >> cardList;

    int n = strlen(cardList);

    for (int i = 0; i < n; i++) {
        check[cardList[i]]++;
    }

    int cnt = 0;
    for (int i = 0; i < 1000; i++) {
        if (check[i] > 0) cnt++;
    }

    cout << cnt << "개";
}

```
