# 기저 조건 찾기

## 1. 문제

```
아래의 상황처럼 재귀를 만들어서 4번째에 bbq함수에 도달할 때 종료하게 해주세요.
main() -> bbq() -> bbq() -> bbq() -> bbq()
```

- 입/출력이 없는 문제입니다.

## 2. 코드

```c++
#include <iostream>
using namespace std;

void bbq(int n) {
    if (n == 3) return;
    bbq(n++);
}

int main()
{
    bbq(0);
}
```
