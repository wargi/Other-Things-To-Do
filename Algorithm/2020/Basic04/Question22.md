# 글자 수 만큼 재귀 돌리기

## 1. 문제

- 한 문장을 입력받고, 입력받은 글자 수 계산하여 재귀를 이용하여 아래의 예제처럼 출력해주세요. 


## 2. 입력

- 한 문장을 입력받습니다.

## 3. 출력

- 입력받은 글자 수 계산하여 재귀를 이용하여 아래의 예제처럼 출력해주세요. 


## 4. 예제 입력
```
SWIFT
```

## 5. 예제 출력
```
5 4 3 2 1 2 3 4 5
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>
using namespace std;

void run(int n) {
    cout << n << " ";
    if (n == 1) return;
    run(n - 1);
    cout << n << " ";
}

int main()
{
    char ch[100];
    cin >> ch;

    int n = strlen(ch);
    run(n);
}
```
