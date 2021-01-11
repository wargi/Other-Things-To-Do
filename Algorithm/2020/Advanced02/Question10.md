# 비밀번호 찾기 #

## 1. 문제
```T
1. 비밀번호 개 수를 입력받고, 다음 줄 부터 4글자로 이루어진 비밀번호를 입력받습니다.
ex)
input)
3
ABCD
ACDE
ADEF

2. A ~ Z까지 모든 경우의 수를 돌려서 비밀번호를 찾아보려고 합니다. 각 입력받은 비밀번호당 몇 번만에 알아낸지 출력하는 프로그램을 작성해주세요.
```

## 2. 입력
- 첫 줄: 비밀번호 개 수를 입력받습니다.
- 다음 줄 부터: 4글자로 이루어진 비밀번호를 입력받습니다.

## 3. 출력

- 각 입력받은 비밀번호당 몇 번만에 알아낸지 출력하는 프로그램을 작성해주세요.

## 4. 예제 입력
```
3
AAAA
AAAC
ZBAB
```

## 5. 예제 출력

```
1
3
440078
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int cnt = 0;
char path[5];
char vect[1000][5];
void dfs(int level, int idx) {
    if (level == 4) {
        cnt++;
        if (strcmp(vect[idx], path) == 0) cout << cnt << "\n";
        return;
    }

    for (char i = 'A'; i <= 'Z'; i++) {
        path[level] = i;
        dfs(level + 1, idx);
        path[level] = 0;
    }
}

int main()
{
    int n;
    cin >> n;

    for (int i = 0; i < n; i++) {
        cin >> vect[i];
    }

    for (int i = 0; i < n; i++) {
        cnt = 0;
        dfs(0, i);
    }

    return 0;
}
```
