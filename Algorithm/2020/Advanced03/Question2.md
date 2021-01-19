# 문장 사이의 숫자 찾기

## 1. 문제
- 문장을 입력 받습니다.
- 문장에는 숫자가 끼어있는데, 문장에 숨어 있는 숫자를 찾아서 5를 더한 결과값을 출력해주세요.

## 2. 입력
- 문장을 입력 받는다.

## 3. 출력
- 문장에 숨어 있는 숫자를 찾아서 5를 더한 결과값을 출력해주세요.

## 4. 예제 입력
```
ATP1326TTA
```

## 5. 예제 출력
```
1331
```

## 6. 코드
```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    int n[100], cnt = 0;

    string s;
    cin >> s;

    for (int i = 0; i < s.size(); i++) {
        int x = s[i] - '0';
        if (x < 10) n[cnt++] = x;
    }

    int x = 0;
    for (int i = 0; i < cnt; i++) {
        x = x * 10 + n[i];
    }

    cout << x + 5;
}
```
