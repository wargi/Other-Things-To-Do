# 빈도수 높은 알파벳 찾기

## 1. 문제

- 대문자로만 이루어진 알파뱃 배열(1x8)을 입력받고, 그중에 가장 빈도수가 높은 알파벳을 출력해주세요.

## 2. 입력

- 대문자로만 이루어진 알파뱃 배열(1x8)을 입력받아주세요.

## 3. 출력
- 가장 빈도수가 높은 알파벳을 출력해주세요.

## 4. 예제 입력
```
ABCCDEEE
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
    char v[9];
    int check[1000] = { 0 };

    for (int i = 0; i < 8; i++) {
        cin >> v[i];
        check[v[i]]++;
    }

    int max = -1;
    char ch;

    for (int i = 0; i < 1000; i++) {
        if (check[i] > max) {
            max = check[i];
            ch = char(i);
        }
    }

    cout << ch;
}
```
