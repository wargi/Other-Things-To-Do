# 트리 재귀 Count

## 1. 문제

- 브랜치와 레벨을 입력받고, 재귀 함수가 호출되는 횟수를 출력해주세요.

## 2. 입력

- 브랜치와 레벨을 입력받습니다.

## 3. 출력

- 재귀 함수가 호출되는 횟수를 출력해주세요.

## 4. 입력 예시

```
4 3
```

## 5. 출력 예시

```
85
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int cnt = 0;

void run(int start, int end, int branch)
{
    cnt++;
    if (start == end) return;
    for (int i = 0; i < branch; i++) {
        run(start + 1, end, branch);
    }
}

int main()
{
    int branch, level;
    cin >> branch >> level;
    run(0, level, branch);
    cout << cnt;
}
```
