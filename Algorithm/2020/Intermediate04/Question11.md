# 알파벳 출력하기

## 1. 문제
- 한 문자를 입력 받고, 입력 받은 문자가 중심이 되게 출력해주세요.
- 예를 들어, D를 입력 받았다면, ABCDEFG를 출력해주세요.
- 만약 A를 A이전은 다시 Z부터해서 XYZABCD 이런식으로 출력해주세요.

## 2. 입력
- 한 문자를 입력 받는다.

## 3. 출력
- 입력 받은 문자가 중심이 되게 출력해주세요.

## 4. 예제 입력
```
F
```

## 5. 예제 출력
```
CDEFGHI
```

## 6. 예제 입력

```
M
```

## 7. 예제 출력

```
JKLMNOP
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    char n;
    cin >> n;

    int a = int(n);

    for (int i = -3; i < 4; i++) {
        int ch = a + i;

        if (ch < 65) {
            ch = 91 - (65 - ch);
            cout << char(ch);
        }
        else if (ch > 90) {
            ch = (ch - 90) + 64;
            cout << char(ch);
        }
        else cout << char(ch);
    }
}
```
