# 2차원 배열 뽑기

## 1. 문제

- 2차원 배열 인형뽑기 기계에는 인형들이 불규칙하게 배치되어 있습니다.
- 그리고 인형에는 각각의 알파벳이 부여되어 있습니다. 
- 인형 뽑기 집게의 좌표와 모양을 입력 받아 인형을 뽑았을때의 문자를 출력해주세요.

## 2. 입력
- 인형뽑기 기계의 가로, 세로 N이 입력 됩니다. (3 <= N <= 1,000)
- 그리고 집게 명령 개수 K 가 입력됩니다.
- 인형이 들어있는 인형 뽑기 기계 내의 정보가 입력 됩니다.
- 그 다음 줄 부터 K 개수의 집게 좌표 Y X 와 집게 형태 M 를 입력 받아 주세요.

## 3. 출력

- 입력 받은 집게 내림 명령 만큼의 문장을 출력 해주세요.

## 4. 예제 입력
```
5 2
A E K X K
Z O Q K P
C F W L X 
C E I H B
N E M I O
1 1 1
3 1 2
```

## 5. 예제 출력

```
EOZQF
CEWMN
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
