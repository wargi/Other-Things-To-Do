# 아파트

## 1. 문제
- 주인공은 현재 아파트의 1층에 서있습니다.
- "up"이라는 명령이 들어오면 2층으로 가고(한 층 올라갑니다.)
- "down"이라는 명령이 들어오면 지하 1층인 B1으로 가고(한 층 내려갑니다.)
- 5번의 명령을 받고 나서 주인공의 층수를 출력해주세요.

## 2. 입력
- up / down 중 하나의 명령어를 총 5개 입력 받습니다.

## 3. 출력
- 5번의 명령을 받고 나서 주인공의 층수를 출력해주세요.

## 4. 예제 입력
```
up
up
down
down
down
```

## 5. 예제 출력
```
B1
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    int x = 1;
    for (int i = 0; i < 5; i++) {
        char input[5];
        cin >> input;

        if (!strcmp(input, "up")) x++;
        else x--;
    }

    if (x < 1) {
        x -= 1;
        x = x * -1;
        cout << "B" << x;
    }
    else {
        cout << x;
    }
}
```
