# 알파벳 감소시키기 #

## 1. 문제

- 한 문자열을 입력받고, 알파벳을 1씩 감소시키며 출력합니다.
- 'A'보다 작아진다면, '_'를 출력합니다.
- 모든 문자들이 '_'가 될 때까지 출력하는 프로그램을 작성해주세요.

## 2. 입력
- 한 문자열을 입력받습니다. (최대 10글자)

## 3. 출력
- 모든 문자들이 '_'가 될 때까지 출력해주세요.

## 4. 예제 입력
```
CGDE
```

## 5. 예제 출력
```
CGDE
BFCD
AEBC
_DAB
_C_A
_B__
_A__
____
```

## 6. 코드
```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    string s;
    cin >> s;

    char maxCh = 'A';

    for (int i = 0; i < s.length(); i++) if (maxCh <= s[i]) maxCh = s[i];

    cout << s << "\n";

    for (char i = maxCh; i >= 'A'; i--) {
        for (int j = 0; j < s.length(); j++) {
            if (s[j] - 1 < 'A') s[j] = '_';
            if (s[j] != '_') s[j] -= 1;
            cout << s[j];
        }
        cout << "\n";
    }

    return 0;
}
```
