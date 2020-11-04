# 로그인

## 1. 문제
```c++
아래는 유저의 아이디, 비밀번호 정보입니다.
ID: qlqlqkq
PW: tkaruqtkf
```

## 2. 입력
- 첫 줄: 유저의 ID를 입력 받습니다.
- 둘 째줄: 유저의 PW를 입력 받습니다.

## 3. 출력
-  입력받은 유저의 정보가 위의 문제에 적힌 유저 정보와 같으면 "LOGIN", 다르면 "INVALID"를 출력해주세요.

## 4. 예제 입력
```
HELLO
SWIFT
```

## 5. 예제 출력
```
INVALID
```

## 6. 코드
```c++
#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    string x, y;
    cin >> x >> y;

    string id = "qlqlaqkq";
    string pw = "tkaruqtkf";

    if (!id.compare(x) && !pw.compare(y)) cout << "LOGIN";
    else cout << "INVALID"; 
}
```
