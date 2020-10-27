# 양쪽에서 문자 찾기 #

## 1. 문제
```
아래에 1차원 배열(1x9)을 하드코딩 해주세요.
A T K P T C A B C
```

- 문자 두 개를 입력받고, 첫 번째 문자는 왼쪽에서 부터, 두 번째 문자는 오른쪽에서부터 찾아 두 문자 간의 간격을 출력해주세요.

## 2. 입력
- 문자 두 개를 입력 받아주세요.

## 3. 출력
- 첫 번째 문자는 왼쪽에서 부터, 두 번째 문자는 오른쪽에서부터 찾아 두 문자 간의 간격을 출력해주세요.

## 4. 예제 입력
```
A C
```

## 5. 예제 출력
```
8
```

## 6. 예제 입력

```
K A
```

## 7. 예제 출력

```
4
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int main()
{
    char child[10] = "ATKPTCABC";

    int start = -1, end = -1;
    char ch1, ch2;

    cin >> ch1 >> ch2;

    for (int i = 0; i < 9; i++) {
        if (start == -1 && child[i] == ch1) start = i;
        if (end == -1 && child[8 - i] == ch2) end = 8 - i;
    }

    cout << end - start;
}
```
