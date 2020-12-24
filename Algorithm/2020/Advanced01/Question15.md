# 데이트 스케줄 #

## 1. 문제
- 나에게 호감을 가지고 있는 친구 n명이 있습니다.
- n 명중에 데이트를 한다면 o, 안한다면 x로 데이트 스케줄의 경우의 수를 출력해주세요. 

## 2. 입력
- 첫째 줄: 숫자 n을 입력받는다. (1 <= n)

## 3. 출력
- 데이트 스케줄의 경우의 수를 출력해주세요

## 4. 예제 입력
```
2
```

## 5. 예제 출력
```
xx
xo
ox
oo
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

char path[3];
void run(int level, int end) {
    if (level == end) {
        cout << path << "\n";
        return;
    }

    for (int i = 0; i < 2; i++)
    {
        char ch;
        if (i % 2 == 0) ch = 'x';
        else ch = 'o';

        path[level] = ch;
        run(level + 1, end);
    }
}

int main()
{
    int n;
    cin >> n;
    run(0, n);
}
```
