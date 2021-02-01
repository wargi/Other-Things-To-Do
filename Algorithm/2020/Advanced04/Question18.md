# 단어 조합하기

## 1. 문제

```
아래의 2차원 배열(3x3)을 하드코딩 해주세요.
"BHC", "BBQ", "KFC",
"MC", "7AVE", "PAPA",
"DHC", "OBS", "MOMS"
```

- 하나의 좌표를 입력받고, 좌표 기준 위/왼쪽/아래/오른쪽에 있는 단어들을 순서대로 출력해주세요.

## 2. 입력
- 첫 째줄: 좌표를 입력받습니다. (y, x)

## 3. 출력

- 입력받은 좌표 기준 위/왼쪽/아래/오른쪽에 있는 단어들을 순서대로 출력해주세요.

## 4. 예제 입력
```
2 2
```

## 5. 예제 출력

```
PAPAOBS
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    string s[3][3] = {
        "BHC", "BBQ", "KFC",
        "MC", "7AVE", "PAPA",
        "DHC", "OBS", "MOMS"
    };

    int y, x;
    cin >> y >> x;

    int direct[4][2] = {
        -1, 0,
        0, -1,
        1, 0,
        0, 1
    };

    for (int i = 0; i < 4; i++) {
        int dy = y + direct[i][0];
        int dx = x + direct[i][1];

        if (dy >= 0 && dy < 3 && dx >= 0 && dx < 3) {
            cout << s[dy][dx];
        }
    }

    return 0;
}
```
