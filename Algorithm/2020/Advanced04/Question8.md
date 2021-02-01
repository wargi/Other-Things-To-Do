# A ~ K 알파벳 찾기 #

## 1. 문제

- 문장을 하나 입력받고, 문장에서 A ~ K 중에 가장 빈도수가 높은 알파벳과 가장 빈도수가 적은 알파벳을 찾는 프로그램을 작성하시오.

## 2. 입력
- 문장 한 개를 입력받는다.

## 3. 출력
- 첫 줄: 가장 빈도수가 높은 알파벳 출력
- 마지막 줄: 가장 빈도수가 낮은 알파벳 출력
- 만약, 빈도수가 같다면 아스키코드값이 작은 알파벳으로 출력

## 4. 예제 입력
```
AAABBEEEAK
```

## 5. 예제 출력
```
A
C
```

## 6. 예제 입력

```
AAAABCDEFIQS
```

## 7. 예제 출력

```
A
G
```

## 8. 코드

```c++
#include <iostream>
#include <string>
using namespace std;

int main()
{
    int minAlpha = 200, maxAlpha = 200;
    int mini = 21e8, maxi = -21e8;
    int check[100] = { 0 };
    string s;
    cin >> s;

    for (int i = 0; i < s.length(); i++) check[s[i]]++;

    for (int i = 'A'; i <= 'K'; i++) {
        if (mini > check[i]) {
            mini = check[i];
            minAlpha = i;
        }

        if (maxi < check[i]) {
            maxi = check[i];
            maxAlpha = i;
        }
    }

    cout << char(maxAlpha) << "\n";
    cout << char(minAlpha);


    return 0;
}
```
