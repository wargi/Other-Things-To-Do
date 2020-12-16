# 글자 출력하기 #

## 1. 문제
- 한 문장(5글자)을 입력받고 재귀를 이용하여 정방향으로 출력하고, 역방향으로 출력해주세요.

## 2. 입력
- 한 문장(5글자)을 입력받는다.

## 3. 출력
- 입력받은 문자를 정방향으로 출력하고, 역방향으로 출력해주세요.

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
using namespace std;

char str[6];

void printString(int n) {
    cout << str[n];
    if (n == 4) {
        cout << "\n" << str[n];
        return;
    }
    printString(n + 1);
    cout << str[n];
}

int main()
{
    cin >> str;
    printString(0);
}
```
