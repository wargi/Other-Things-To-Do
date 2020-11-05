# 트리 만들기

## 1. 문제

- 레벨과 브랜치를 입력받고, 그 만큼 재귀호출을 해주세요.

## 2. 입력
- 첫 째줄: 레벨을 입력받습니다.
- 둘 째줄: 브렌치를 입력받습니다.

## 3. 예제 입력
```
2
3
```

## 4. 코드
```c++
#include <iostream>
using namespace std;

void run(int start, int end, int branch) {
    if (end == start) return;
    for (int i = 0; i < branch; i++) {
        run(start + 1, end, branch);
    }
}

int main()
{
    int level, branch;
    cin >> level >> branch;
    run(0, level, branch);
}
```
