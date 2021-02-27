# 라인 바꾸기

## 1. 문제

- 2차원 문자 배열(5x5)을 입력받고, 2차원 배열의 세로줄인 1번 라인(1열)과 3번 라인(3열)을 바꾸어 줍니다.
- 바꾼 후에 배열의 각 행에 "WARGI"가 존재하는 찾아주세요.
- 존재한다면 "yes"를 출력, 존재하지않는다면 "no"를 출력해주세요.

## 2. 입력

- 2차원 문자 배열(5x5)을 입력받습니다.

## 3. 출력

- 바꾼 후에 배열의 각 행에 "WARGI"가 존재한다면 "yes"를 출력, 존재하지않는다면 "no"를 출력해주세요.

## 4. 입력 예제

```
ABCDE
QWERT
ZXCVB
OPERA
WGRAI
```

## 5. 출력 예제

```
yes
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
#include <string>
using namespace std;

int main()
{
    string s[5];

    for (int i = 0; i < 5; i++) cin >> s[i];

    for (int i = 0; i < 5; i++) {
        char temp = s[i][1];
        s[i][1] = s[i][3];
        s[i][3] = temp;
    }

    int flag = 0;
    for (int i = 0; i < 5; i++) {
        if (s[i] == "WARGI") {
            flag = 1;
            break;
        }
    }

    if (flag) cout << "yes";
    else cout << "no";

    return 0;
}
```
