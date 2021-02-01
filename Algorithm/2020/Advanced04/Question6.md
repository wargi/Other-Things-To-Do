# string 익혀보기

## 1. 문제
- char 배열 대신 string을 이용하여 문자열을 입력 받고, 순차적으로 출력하고 다음줄에 역순으로 출력해주세요.

```
ex)
input: APPLE
output)
APPLE
ELPPA
```

## 2. 입력
- 문자열을 입력 받습니다.

## 3. 출력
- 순차적으로 출력하고 다음줄에 역순으로 출력해주세요.

## 4. 예제 입력
```
SWIFT
```

## 5. 예제 출력
```
SWIFT
TFIWS
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

    cout << s << "\n";

    for (int i = s.length() - 1; i >= 0; i--) cout << s[i];
}
```
