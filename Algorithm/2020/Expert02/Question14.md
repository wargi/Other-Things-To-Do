# 금, 은, 동 뽑기 #

## 1. 문제
- n명이 수영을 합니다.
- 이 중에 1~3등을 뽑아 메달을 주는데 나올 수 있는 경우의 수는 몇 개인지 출력하는 프로그램을 작성해주세요.

## 2. 입력
- n명을 입력받습니다.

## 3. 출력
- 경우의 수는 몇 개인지 출력해주세요.

## 4. 예제 입력
```
4
```

## 5. 예제 출력
```
24
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int cnt = 0;
void run(int start, int branch) {
    if (start == 3) {
        cnt++;
        return;
    }

    for (int i = start; i < branch; i++) {
        run(start + 1, branch);
    }
}

int main()
{
    int n;
    cin >> n;

    run(0, n);

    cout << cnt;

    return 0;
}
```
