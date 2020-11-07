# 저글링 이동

## 1. 문제

```
저글링을 조종하려고 합니다.
현재 저글링의 좌표는 x,y(5,5)에 위치합니다.
저글링에게 내릴 수 있는 명령어는 up/down/left/right/click 입니다.
명령어 n개를 입력받아, 명령을 수행한 결과들을 출력해주세요.

<명령어>
up: y축으로 한칸 -1
down: y축으로 한칸 +1
left: x축으로 한칸 -1
right: x축으로 한칸 +1
click: 현재 좌표 출력
```

## 2. 입력
- 첫 줄: 명령어 수를 입력받습니다.
- 명령어 들을 입력 받습니다.

## 3. 출력

- 명령어 수행 결과를 출력해주세요.


## 4. 예제 입력
```
3
up
up
click
```

## 5. 예제 출력
```
3,5
```

## 6. 예제 입력

```
4
down
click
left
click
```

## 7. 예제 출력

```
6,5
6,4
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

struct Mouse {
    int x, y;

    void up() {
        y--;
    }

    void down() {
        y++;
    }

    void left() {
        x--;
    }

    void right() {
        x++;
    }

    void click() {
        cout << y << "," << x << "\n";
    }
};

int main()
{
    int n;
    char str[100][100];
    cin >> n;

    Mouse m = { 5, 5 };
    
    for (int i = 0; i < n; i++) {
        cin >> str[i];
    }

    for (int i = 0; i < n; i++) {
        if (!strcmp(str[i], "up")) m.up();
        else if (!strcmp(str[i], "down")) m.down();
        else if (!strcmp(str[i], "left")) m.left();
        else if (!strcmp(str[i], "right")) m.right();
        else m.click();
    }
}
```
