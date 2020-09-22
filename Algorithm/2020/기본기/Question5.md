# 문자 제거하기 #

## 1. 문제
- 믄장 하나와 인덱스를 하나 입력받고 해당하는 문자를 제거한 후에 출력해주세요.

## 2. 입력
- 첫째 줄: 한 개의 문장이 주어진다.
- 둘째 줄: 지울 인덱스의 번호가 주어진다.

## 3. 출력
- 해당하는 인덱스를 삭제 후에 결과 값 출력.

## 4. 예제 입력
```
hello!swift
5
```

## 5. 예제 출력
```
helloswift
```

## 6. 코드
```c++
#include <iostream>
using namespace std;

int main()
{
    char someStr[11];
    int n, cnt = 0;

    cin >> someStr >> n;

    for (int i = 0; i < 11; i++) {
        if (someStr[i] == '\0') break;
        cnt++;
    }

    char temp;

    for (int i = n; i < cnt; i++) {
        someStr[i] = someStr[i+1];
    }

    cout << someStr;
}
```
