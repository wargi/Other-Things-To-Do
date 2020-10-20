# 중복 제거

## 1. 문제
- 한 문장을 입력받고, 중복 입력된 알파벳을 제거하고 출력해주세요

## 2. 입력
- 한 개의 문장을 입력받는다.

## 3. 출력
- 중복을 제거한 문장을 출력해주세요.

## 4. 예제 입력
```
AABACDDED
```

## 5. 예제 출력
```
ABCDE
```

## 6. 코드

```c++
#include <iostream>
#include <cstring>

using namespace std;

int main()
{
    char ch[11];
    cin >> ch;

    int n = strlen(ch);
    int check[100] = { 0 };

    for (int i = 0; i < n; i++) check[ch[i]]++;

    for (int i = 0; i < 100; i++) {
        if (check[i] > 0) cout << char(i);
    }
}
```
