# 트리 만들기

## 1. 문제
```
아래 처럼 트리를 재귀를 이용하여 만들어 주세요.
          시작
        /  |  \
      O    O    O
    /|\   /|\   /|\
   O O O O O O O O O
```

## 2. 코드
```c++
#include <iostream>
using namespace std;

void run(int level) {
    if (level == 1) return;
    run(level + 1);
    run(level + 1);
    run(level + 1);
}

int main()
{
    run(0);
}
```
