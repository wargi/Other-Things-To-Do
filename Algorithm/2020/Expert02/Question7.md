# n번째 큰 숫자 찾기 #

## 1. 문제
```
아래의 1차원 배열(1x6)을 하드코딩 해주세요.
1 5 4 2 -5 -7
```

- n을 입력 받습니다. (1 <= n <= 6)
- n번째 큰 숫자를 출력하는 프로그램을 작성해주세요.

## 2. 입력

- n을 입력 받습니다. (1 <= n <= 6)

## 3. 출력
- n번째 큰 숫자를 출력하는 프로그램을 작성해주세요.

## 4. 예제 입력
```
1
```

## 5. 예제 출력
```
5
```

## 6. 예제 입력

```
4
```

## 7. 예제 출력

```
1
```

## 8. 코드

```c++
#include <iostream>
using namespace std;

int vect[6] = { 1, 5, 4, 2, -5, -7 };

int main()
{
    int n, idx;
    cin >> n;

    for (int i = 0; i < n; i++) {
        int max = -1000;
        for (int j = 0; j < 6; j++) {
            if (max < vect[j]) {
                idx = j;
                max = vect[j];
            }
        }
        if (i != (n - 1)) vect[idx] = -1000;
    }

    cout << vect[idx];

    return 0;
}
```
