# 문장속에 문장 찾기 2 #

## 1. 문제

- 문장 5개를 입력받고, 문장에 "MIT"라는 단어가 총 몇개 있는지 출력해주세요.

## 2. 입력
- 문장 5개를 입력받는다.

## 3. 출력
-  문장에 "MIT"라는 단어가 총 몇개 있는지 출력해주세요.

## 4. 예제 입력
```
ATVMITMIT
CCCMIIT
MITTD
MITTTI
MMMMM
```

## 5. 예제 출력
```
4
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    int cnt = 0;
    string t[5];

    for (int i = 0; i < 5; i++) {
        cin >> t[i];
    }

    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < t[i].length(); j++) {
            int n = t[i].find("MIT", j);
            if (n >= 0) {
                cnt++;
                j = n;
            }
            else {
                break;
            }
        }
    }

    cout << cnt;

    return 0;
}
```
