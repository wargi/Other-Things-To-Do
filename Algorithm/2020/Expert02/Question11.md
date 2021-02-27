# 10 ~ 20은 몇개?!

## 1. 문제
- 숫자로 구성된 1차원 배열(1x5)을 입력 받습니다.
- 입력 받은 숫자들을 조합하여(중복 없이) 10 ~ 20 사이의 값이 되는 경우의 수가 몇 개인지 출력하는 프로그램을 작성하시오.

## 2. 입력
- 숫자로 구성된 1차원 배열(1x5)을 입력 받습니다.

## 3. 출력
- 입력 받은 숫자들을 조합하여(중복 없이) 10 ~ 20 사이의 값이 되는 경우의 수가 몇 개인지 출력해주세요.

## 4. 예제 입력
```
5 4 3 9 1
```

## 5. 예제 출력
```
16
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int vect[5];
int check[5];
int path[5];
int cnt = 0;
void dfs(int now, int level, int sum, int end) {
    if (level == end) {
        if (sum >= 10 && sum <= 20) {
            cnt++;
        }

        return;
    }

    for (int i = now; i < 5; i++) {
        if (check[i] == 1) continue;
        check[i] = 1;
        path[level] = vect[i];
        dfs(i, level + 1, sum + vect[i], end);
        path[level] = 0;
        check[i] = 0;
    }
}

int main()
{
    for (int i = 0; i < 5; i++) cin >> vect[i];

    int total = 0;
    for (int i = 1; i <= 5; i++) {
        cnt = 0;
        dfs(0, 0, 0, i);
        total += cnt;
    }
    

    cout << total;

    return 0;
}
```
