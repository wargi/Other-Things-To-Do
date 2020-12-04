# 중복 없이 카드 뽑기 #

## 1. 문제
- A, B, C, D
- 4장의 카드가 있습니다.
- 몇 장을 입력받을지 n을 입력받아주세요. (1 <= n <= 4)
- n장을 중복없이 뽑는 경우들을 출력해주세요.

## 2. 입력

-  n을 입력받아주세요. (1 <= n <= 4)

## 3. 출력
- n장을 중복없이 뽑는 경우들을 출력해주세요.

## 4. 예제 입력
```
2
```

## 5. 출력

```
AB
AC
AD
BA
BC
BD
CA
CB
CD
DA
DB
DC
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

char path[100];
int via[1000] = { 0 };
void run(int start, int limit) {
    if (start == limit) {
        cout << path << "\n";
        return;
    }

    for (char i = 'A'; i <= 'D'; i++) {
        if (via[i] == 0) {
            via[i] = 1;
            path[start] = i;
            run(start + 1, limit);
            path[start] = 0;
            via[i] = 0;
        }
    }
}

int main()
{
    int n;
    cin >> n;

    run(0, n);
}
```