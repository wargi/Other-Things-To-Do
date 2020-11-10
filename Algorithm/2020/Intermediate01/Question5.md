# 저글링 컨트롤 #

## 1. 문제
```
아래의 Map 2차원 배열(5x3)을 하드코딩 해주세요.
_ _ _
_ _ _
A B C
_ _ _
_ _ _

A, B, C의 저글링이 있습니다.
UP/DOWN/LEFT/RIGHT의 명령어가 있습니다.

UP: y죄표 -1
DOWN: y좌표 +1
LEFT: x좌표 -1
RIGHT: x좌표 +1

7개의 명령어를 입력받고, 명령어는 A UP 이런식으로 받습니다.
명령어를 모두 실행하고 맵을 출력해주세요.
```

## 2. 입력
- 7개의 명령어를 입력 받습니다.

## 3. 출력
- 명령어를 모두 실행하고 맵을 출력해주세요.

## 4. 예제 입력
```
A UP
B DOWN
C UP
A RIGHT
C UP
C LEFT
A LEFT
```

## 5. 예제 출력
```
_C_
A__
___
_B_
___
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
using namespace std;

struct Model {
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
};

int main()
{
    Model a = { 0, 2 };
    Model b = { 1, 2 };
    Model c = { 2, 2 };

    char map[5][4] = {
        "___",
        "___",
        "___",
        "___",
        "___"
    };

    for (int i = 0; i < 7; i++) {
        char lValue, rValue[10];
        cin >> lValue >> rValue;

        if(lValue == 'A')
        {
            if (!strcmp(rValue, "UP")) a.up();
            if (!strcmp(rValue, "DOWN")) a.down();
            if (!strcmp(rValue, "LEFT")) a.left();
            if (!strcmp(rValue, "RIGHT")) a.right();
        }

        if (lValue == 'B')
        {
            if (!strcmp(rValue, "UP")) b.up();
            if (!strcmp(rValue, "DOWN")) b.down();
            if (!strcmp(rValue, "LEFT")) b.left();
            if (!strcmp(rValue, "RIGHT")) b.right();
        }

        if (lValue == 'C')
        {
            if (!strcmp(rValue, "UP")) c.up();
            if (!strcmp(rValue, "DOWN")) c.down();
            if (!strcmp(rValue, "LEFT")) c.left();
            if (!strcmp(rValue, "RIGHT")) c.right();
        }
    }

    map[a.y][a.x] = 'A';
    map[b.y][b.x] = 'B';
    map[c.y][c.x] = 'C';

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 3; j++) {
            cout << map[i][j];
        }
        cout << "\n";
    }
}
```
