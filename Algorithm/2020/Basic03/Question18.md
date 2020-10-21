# SWIFT 찾기

## 1. 문제

- "SWIFT" 문장을 vect배열에 저장하고 찾을 문자 개수 n과 n개의 알파벳을 입력받아주세요.
- 그리고 입력 받은 알파벳이 포함되면 'O', 포함되지 않으면 'X'를 출력해주세요.

## 2. 입력

- 찾을 문자 개수 n과 n개의 알파벳을 입력받아주세요.

## 3. 출력
- 입력 받은 알파벳이 포함되면 'O', 포함되지 않으면 'X'를 출력해주세요.

## 4. 예제 입력
```
3
I N T
```

## 5. 예제 출력
```
OXO
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    char vect[10] = "SWIFT";

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
