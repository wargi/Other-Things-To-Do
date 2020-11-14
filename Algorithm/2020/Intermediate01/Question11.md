# 길고 짧은 문장 찾기

## 1. 문제
- 네 문장을 입력 받고, 긴 문장과 짧은 문장이 몇번째 index에 있는지 출력해주세요.

## 2. 입력
- 문장 네 개를 입력받는다.

## 3. 출력
- 긴 문장과 짧은 문장이 몇번째 index에 있는지 출력해주세요.

## 4. 예제 입력
```
bye
2020
hi
wargi
```

## 5. 예제 출력
```
긴문장:2
짧은문장:3
```

## 6. 예제 입력

```
kakao
samsung
lg
naver
```

## 7. 예제 출력

```
긴문장:1
짧은문장:2
```

## 8. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char str[4][100];
    int mx = -1, mi, my = 1000000000, mj;
    for (int i = 0; i < 4; i++) {
        cin >> str[i];
        int n = strlen(str[i]);

        if (mx <= n) {
            mx = n;
            mi = i;
        }

        if (my >= n) {
            my = n;
            mj = i;
        }
    }

    cout << "긴문장:" << mi << "\n";
    cout << "짧은문장:" << mj;
}
```
