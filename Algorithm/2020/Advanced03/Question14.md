# 검색 엔진 #

## 1. 문제
- 네 글자의 대문자로만 구성된 문자들을 검색하는 검색엔진을 만들어야 합니다.
- 먼저, 아래의 6개의 단어들을 하드코딩 해주세요.

```
ABCD ABCE AGEH EIEI FEQE ABAD
```

- 네 글자로 된 검색어를 입력 받습니다.
- 만약 A??? 을 입력 받으면, A로 시작하는 네 글자를 검색을 하고, 만약 ?C?B 을 입력 받는다면, 두 번째 글자는 C, 네 번째 글자는 B인 단어를 검색합니다.
- 6개의 단어 중에 몇 개의 단어가 검색되는지 개수를 출력하는 프로그램을 작성하시오.


## 2. 입력
- 네 글자로 된 검색어를 입력 받습니다.

## 3. 출력
- 6개의 단어 중에 몇 개의 단어가 검색되는지 개수를 출력해주세요.

## 4. 예제 입력
```
?B??
```

## 5. 예제 출력
```
3
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

string arr[6] = {
    "ABCD",
    "ABCE",
    "AGEH",
    "EIEI",
    "FEQE",
    "ABAD"
};

int main()
{
    int cnt = 0;
    string s;
    cin >> s;

    for (int i = 0; i < 6; i++) {
        int flag = 1;
        for (int j = 0; j < 4; j++) {
            if (arr[i][j] != s[j] && s[j] != '?') {
                flag = 0;
                break;
            }
        }
        if (flag) cnt++;
    }

    cout << cnt;

    return 0;
}
```
