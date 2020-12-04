# 도플갱어

## 1. 문제
- 6개의 숫자를 입력 받고, 같은 숫자가 존재하면 "도플갱어 발견", 존재하지 않는다면 "미발견"을 출력해주세요.

## 2. 입력
- 1차원 배열(1x6)을 입력 받는다.

## 3. 출력
- 같은 숫자가 존재하면 "도플갱어 발견", 존재하지 않는다면 "미발견"을 출력해주세요.

## 4. 예제 입력
```
1 3 3 5 1 4
```

## 5. 예제 출력
```
도플갱어 발견
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    int input[6];
    int check[100] = { 0 };

    for (int i = 0; i < 6; i++) {
        cin >> input[i];
        check[input[i]]++;
    }

    int flag = 1;

    for (int i = 0; i < 100; i++) {
        if (check[i] > 1) {
            flag = 0;
            break;
        }
    }

    if (flag) cout << "미발견";
    else cout << "도플갱어 발견";
}
```
