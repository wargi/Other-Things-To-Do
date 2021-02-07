# 숫자 10 만들기 #

## 1. 문제
- 입력받은 숫자 갯수로 10을 만들 수 있는 조합의 수를 출력하세요.
- 사용 되는 숫자의 범위는 1 ~ 9 입니다.
- 만일 입력 받은 N이 3 이라면, 3개의 숫자를 더하여 10이 되는 숫자 조합의 개 수를 출력하면 됩니다.


## 2. 입력
- 1 ~ 9까지의 숫자 중에 사용될 숫자의 개수 N을 입력 하세요.

## 3. 출력
- 숫자의 개수 N을 조합하여 10이 되는 경우의 수의 총합을 출력하세요.

## 4. 예제 입력
```
3
```

## 5. 예제 출력
```
36
```

## 6. 코드

```c++
#include <iostream>
using namespace std;

int cnt = 0;
void dfs(int level, int end, int sum) {
    if (level == end) {
        if (sum == 10) cnt++;
        return;
    }

    for (int i = 1; i < 10; i++) {
        dfs(level + 1, end, sum + i);
    }
}

int main()
{
    int n;
    cin >> n;

    dfs(0, n, 0);
    cout << cnt;

    return 0;
}
```
