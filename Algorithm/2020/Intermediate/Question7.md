# WARGIPARK 찾기 #

## 1. 문제
```
아래의 문장을 하드코딩 해주세요.
WARGIPARK
```

- 입력 받을 문자 개수 n과 문자를 입력받고, 하드코딩 문장에 포함되면 O 아니라면 X를 출력해주세요.

## 2. 입력
- 첫 째줄: 문자 n을 입력 받는다. (1 <= n <= 9)
- 둘 째줄: 문자들을 입력받는다.

## 3. 출력
- 문장에 포함되면 O 아니라면 X를 출력해주세요.

## 4. 예제 입력
```
3
S A N
```

## 5. 예제 출력
```
XOX
```

## 6. 예제 입력

```
G W O
```

## 7. 예제 출력

```
OOX
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    char vect[10] = "WARGIPARK";

    int n;
    cin >> n;

    int check[1000] = { 0 };
    char chArr[100];

    for (int i = 0; i < 9; i++) {
        check[vect[i]]++;
    }

    for (int i = 0; i < n; i++) {
        cin >> chArr[i];
    }

    for (int i = 0; i < n; i++) {
        if (check[chArr[i]] > 0) cout << "O";
        else cout << "X";
    }
}
```
