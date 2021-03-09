# 레드마블 #

## 1. 문제
<img src="./Array06.png" alt="Array" style="zoom:105%;" />

- 총 12칸으로 된 맵이 있습니다. ( 0번 index값은 항상 0 입니다. )
- 레드마을에 사는 부르스는 0번에서 시작해서, **(2칸)** 또는 **(3칸)** 또는 **(현재 index \* 2칸)** 으로 점프 할 수 있습니다.
- 12번 index 이상 지역에 도착 할 때 얻을 수 있는 최대점수를 출력 하세요.

## 2. 입력
- 1x12로 된 맵을 입력받습니다.

## 3. 출력

- 12번 index 이상 지역에 도착 할 때 얻을 수 있는 최대점수를 출력 하세요.

## 4. 예제 입력
```
0 2 4 -5 -7 6 20 7 -10 -8  4 -1
```

## 5. 예제 출력

```
21
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int map[30];
int direct[3] = { 2, 3, 2 };
int scoreMap[30] = { 0 };
int flagMap[12] = { 0 };

void init()
{
    for (int i = 0; i < 12; i++) {
        cin >> map[i];
        scoreMap[i] = map[i];
    }
}

int main()
{
    init();

    int maxi = -21e8;

    for (int i = 2; i < 12; i++) {

        for (int t = 0; t < 2; t++) {
            int dx = i + direct[t];
            if (t == 2) dx = i * direct[t];

            int temp = scoreMap[i] + map[dx];

            if (scoreMap[dx] < temp || !flagMap[dx]) {
                flagMap[dx] = 1;
                scoreMap[dx] = temp;
            }

            if (dx > 11 && scoreMap[dx] > maxi) maxi = scoreMap[dx];
        }
    }
    
    cout << maxi;

    return 0;
}
```
