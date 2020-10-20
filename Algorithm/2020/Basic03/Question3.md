# 빈도수 높은 알파벳 찾기 2 #

## 1. 문제
- 한 문장을 입력받고 가장 빈도수가 많은 알파벳을 출력해주세요.

## 2. 입력
- 대문자 알파벳으로 구성된 문장을 입력받는다.

## 3. 출력
- 가장 빈도수가 많은 알파벳을 출력해주세요.

## 4. 예제 입력
```
AFKAFKEEE
```

## 5. 예제 출력
```
E
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char alpha[11];
    cin >> alpha;

    int n = strlen(alpha);
    int max = -1;

    char ch;
    int check[1000] = { 0 };

    for (int i = 0; i < n; i++) {
        check[alpha[i]]++;
    }

    for (int i = 0; i < 1000; i++) {
        if (max < check[i]) {
            max = check[i];
            ch = char(i);
        }
    }

    cout << ch;

}
```
