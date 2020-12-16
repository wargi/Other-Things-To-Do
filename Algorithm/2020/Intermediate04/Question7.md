# 재귀 익혀보기 #

## 1. 문제
```
아래와 같이 bbq를 세번 호출하고 리턴하는 프로그램을 작성해주세요.
main() -> bbq() -> bbq() -> bbq()
```

## 2. 코드
```c++
#include <iostream>
using namespace std;

void bbq(int val) {
    if (val == 2) return;
    bbq(val + 1);
}

int main()
{
    bbq(0);
}
```
