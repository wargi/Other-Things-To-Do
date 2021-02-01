# 통과율

## 1. 문제
- 한 문장을 입력받고, Pass와 Fail이 몇 개 존재하는지 확인하고 통과율을 출력해주세요.
- 예를 들어 PASS가 4개, FAIL이 3개라면 4 / 7 * 100이므로, 정답은 57%입니다.

## 2. 입력
- 한 문장을 입력 받습니다.
- Pass와 Fail은 (PAss/PASs/PASS/FAil/FAIl/FAIL) 소문자와 대문자가 섞여서 나옵니다.

## 3. 출력
- 통과율이 몇프로인지 출력해주세요.

## 4. 예제 입력
```
PassPAssPASsPASS/////fail
```

## 5. 예제 출력
```
80%
```

## 6. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    float pCnt = 0, fCnt = 0;
    string s;
    cin >> s;

    for (int i = 0; i < s.length(); i++) {
        if (s[i] >= 'a' && s[i] <= 'z') {
            s[i] -= 32;
        }
    }

    for (int i = 0; i < s.length(); i++) {
        int n = s.find("PASS", i);

        if (n >= 0) {
            pCnt++;
            i = n;
        }
        else {
            break;
        }
    }

    for (int i = 0; i < s.length(); i++) {
        int n = s.find("FAIL", i);

        if (n >= 0) {
            fCnt++;
            i = n;
        }
        else {
            break;
        }
    }

    int per = pCnt / (pCnt + fCnt) * 100;

    cout << per << "%";

    return 0;
}
```
