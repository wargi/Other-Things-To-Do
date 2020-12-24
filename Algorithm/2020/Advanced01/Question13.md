# 암호 찾기 #

## 1. 문제
```
아래의 암호가 저장되어 있는 1차원 배열(1x5)을 하드코딩해주세요.

"Jason", "Dr.tom", "EXEXI", "GK12P", "POW"
```

- 문장을 하나 입력 받고, 위의 암호가 저장되어 있는 배열에 일치하는 게 있으면, "암호해제", 없으면 "암호틀림"을 출력해주세요.

## 2. 입력
- 첫째 줄: 문장을 하나 입력 받습니다.

## 3. 출력
- 위의 암호가 저장되어 있는 배열에 일치하는 게 있으면, "암호해제", 없으면 "암호틀림"을 출력해주세요.

## 4. 예제 입력
```
Dr.tim
```

## 5. 예제 출력
```
암호틀림
```

## 6. 예제 입력

```
Dr.tom
```

## 7. 예제 출력

```
암호해제
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char arr[5][11] = {
        "Jason",
        "Dr.tom",
        "EXEXI",
        "GK12P",
        "POW"
    };

    char ch[11];
    cin >> ch;

    int flag = 0;
    for (int i = 0; i < 5; i++) {
        if (!strcmp(arr[i], ch)) {
            flag = 1;
            break;
        }
    }

    if (flag) cout << "암호해제";
    else cout << "암호틀림";
}
```
