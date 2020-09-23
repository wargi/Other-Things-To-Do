# 문장에 'W' 찾기 #

## 1. 문제
- 세 문장을 입력받고 문장들 중에 W가 존재하는지 확인.

## 2. 입력
- 세 문장을 입력받는다.

## 3. 출력
- 존재하면 O, 존재하지 않으면 X를 출력한다.

## 4. 예제 입력
```
SANGWOOK
PARK
WARGI
```

## 5. 예제 출력
```
O
```

## 6. 예제 입력

```
HELLO
iOS
2021
```

## 7. 예제 출력

```
X
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    char someStr[3][11];

    bool flag = false;
    for (int i = 0; i < 3; i++) cin >> someStr[i];

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 10; j++) {
            if ('W' == someStr[i][j]) {
                flag = true;
                break;
            }
        }
    }

    if (flag) cout << "O";
    else cout << "X";
}
```
