# 수족관 속의 상어 #

## 1. 문제

- 수족관에 일렬로 상어들이 지나가고 있습니다. 
- 이 중에 가장 긴 상어 한마리를 찾을려고 할 때, 가장 긴 상어를 찾아 출력 해 주세요.

## 2. 입력
- 최대 길이 100인 문장이 입력 됩니다.
- 상어는 ~ 로 표시되고, 나머지 물체들은 #으로 표시 됩니다.

## 3. 출력
- 가장 긴 상어를 출력 해주세요.

## 4. 예제 입력
```
#~~~~~~~#~~~~#
```

## 5. 예제 출력
```
~~~~~~~
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

    int start = -1;
    int max = -1;
    for (int i = 0; i < s.length(); i++) {
        if (s[i] == '#') {
            if (start == -1) {
                start = i;
            }
            else {
                int length = (i - start) - 1;
                if (max < length) {
                    max = length;
                }
                start = i;
            }
            continue;
        }
    }

    for (int i = 0; i < max; i++) cout << "~";

    return 0;
}
```
