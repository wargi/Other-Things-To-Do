# 나누어 비교하기

## 1. 문제
- 한 문장을 입력받고, 문장을 나누어서 아래의 예시와 같이 비교해 주세요.

```
input: ABCDABC (문장의 길이: 7)
문장의 길이를 2로 나누어, (7 / 2 = 3)

0 ~ 2번 ABC
3 ~ 6번 DABC

나눈 문장이 같은지 비교합니다.
같으면 "동일한문장", 아니라면 "다른문장"이라고 출력합니다.
```

## 2. 입력
- 한 개의 문장을 입력받는다.

## 3. 출력
- 입력받은 문장을 나눈 각 각의 문장이 같으면 "동일한문장", 아니라면 "다른문장"이라고 출력합니다.

## 4. 예제 입력
```
ABCABC
```

## 5. 예제 출력
```
동일한문장
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char str[11];
    cin >> str;
    int n = strlen(str);
    
    if (n % 2 == 0) {
        int flag = 1;
        for (int i = 0; i < n / 2; i++) {
            if (str[i] != str[n / 2 + i]) {
                flag = 0;
                break;
            }
        }
        if (flag) cout << "동일한문장";
        else cout << "다른문장";
    }
    else cout << "다른문장";
}
```
