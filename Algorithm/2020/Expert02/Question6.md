# 경우의 수

## 1. 문제

- 축구 경기에서 승부차기의 순간까지 왔습니다.
- 만약, ooxx라면 1번 2번 선수가 골을 넣은 것 입니다.
- 승부차기할 선수의 수를 입력 받고, 가능한 경우의 수를 출력하는 프로그램을 작성하시오.

```
ex)
input: 3

output)
ooo
oox
oxo
oxx
xoo
xox
xxo
xxx
```

## 2. 입력
- 승부차기할 선수의 수를 입력 받아 주세요.

## 3. 출력
- 가능한 경우의 수를 출력해주세요.

## 4. 예제 입력
```
4
```

## 5. 예제 출력
```
oooo
ooox
ooxo
ooxx
oxoo
oxox
oxxo
oxxx
xooo
xoox
xoxo
xoxx
xxoo
xxox
xxxo
xxxx
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

char path[100];

void dfs(int level, int end) {
    if (level == end) {
        cout << path << "\n";
        return;
    }

    for (int i = 0; i < 2; i++) {
        if (i) path[level] = 'x';
        else path[level] = 'o';
        dfs(level + 1, end);
        path[level] = 0;
    }
}

int main()
{
    int n;
    cin >> n;

    dfs(0, n);

    return 0;
}
```
