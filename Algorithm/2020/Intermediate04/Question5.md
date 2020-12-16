# 부메랑 2 #

## 1. 문제
```
아래에 1차원 배열(1x8)을 하드코딩 해주세요.
3 7 4 1 9 4 6 2
```

- 한 개의 index를 입력받아 주세요.
- 입력 받은 index -> 0번 index -> 입력받은 index순으로 출력해주세요.

## 2. 입력
- 한 개의 index를 입력받아 주세요.

## 3. 출력
- 입력 받은 index -> 0번 index -> 입력받은 index순으로 출력해주세요.

## 4. 예제 입력
```
5
```

## 5. 예제 출력
```
4 9 1 4 7 3 7 4 1 9 4
```

## 6. 예제 입력

```
2
```

## 7. 예제 출력

```
4 7 3 7 4
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int boomerang[8] = { 3, 7, 4, 1, 9, 4, 6, 2 };

int returnMap(int n) {
    cout << boomerang[n] << " ";
    if (n == 0) return 0;
    returnMap(n - 1);
    cout << boomerang[n] << " ";
}

int main()
{
    int n;
    cin >> n;

    returnMap(n);
}
```
