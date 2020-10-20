# 글자 바꾸기

## 1. 문제
- 한 개의 문장을 입력받고, a와 b의 변수에 각 각 문자를 입력받아 주세요.
- 그리고, 문장에서 a와 같은 문자를 찾고 a의 문자를 b로 변경해주세요.

## 2. 입력
- 첫 번째 줄: 문장을 입력받는다.

- 두 번째 줄: 바꿀 문자를 입력받는다.

- 세 번째 줄: 변경할 문자를 입력받는다.


## 3. 출력
- 변경된 결과를 출력한다.

## 4. 예제 입력
```
sangwook
o
u
```

## 5. 예제 출력
```
sangwuuk
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    char someStr[11], n, m;
    int cnt = 0;

    cin >> someStr >> n >> m;

    for (int i = 0; i < 11; i++) {
        if (someStr[i] == '\0') break;
        cnt++;
    }

    for (int i = 0; i < cnt; i++) {
        if (someStr[i] == n) someStr[i] = m;
    }

    cout << someStr;
}
```
