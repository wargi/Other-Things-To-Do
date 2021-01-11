# 카드 뽑기

## 1. 문제
- 카드 리스트를 입력받아 주세요.(A ~ Z)
- 리스트의 카드 중에 몇 장을 뽑을지 입력 받습니다.
- 중복을 허용하여 같은 카드도 뽑을 수 있다면 카드를 뽑을 수 있는 경우의 수를 출력하는 프로그램을 작성하시오.

## 2. 입력
- 첫 줄: 카드 리스트를 입력받는다.
- 마지막 줄: 카드를 몇 장을 뽑을지 입력 받습니다.

## 3. 출력
- 카드를 뽑을수 있는 경우의 수를 출력해주세요.

## 4. 예제 입력
```
AGFT
2
```

## 5. 예제 출력
```
AA
AG
AF
AT
GA
GG
GF
GT
FA
FG
FF
FT
TA
TG
TF
TT
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

string s;
char path[100];

void dfs(int level, int end) {
    if (level == end) {
        cout << path << "\n";
        return;
    }

    for (int i = 0; i < s.size(); i++) {
        path[level] = s[i];
        dfs(level + 1, end);
        path[level] = 0;
    }
}

int main()
{
    int n;
    cin >> s >> n;
    dfs(0, n);

    return 0;
}
```
